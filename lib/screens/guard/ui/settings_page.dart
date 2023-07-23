import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/screens/guard/ui/view_users.dart';
import 'package:appdevelopment/screens/guard/controller/guard_controller.dart';
import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/terms_and_conditions.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/privacy_policy.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io' show File;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsPageController _guardController = SettingsPageController();
  final picker = ImagePicker();
  User? user;
  File? pickedImage;
  String? imageUrl;
  String? pickedImagePath;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _guardController.loadUserData();
    loadPickedImage();
  }

  void loadPickedImage() {
    final storage = FirebaseFirestore.instance;
    final collectionRef = storage.collection('users');
    final documentRef = collectionRef.doc(user!.uid);
    documentRef.get().then((snapshot) {
      setState(() {
        pickedImagePath = snapshot.get('profilePicture');
      });
    });
  }

  Future<void> updateProfilePicture2() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });

      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final collectionRef = FirebaseFirestore.instance.collection('users');
        final documentRef = collectionRef.doc(user.uid);

        final imageUrl = await uploadImageToStorage(pickedImage!);

        await documentRef.update({
          'profilePicture': imageUrl,
        });

        setState(() {
          pickedImagePath = imageUrl;
        });
      }
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    final storageRef = FirebaseStorage.instance.ref().child('profile_pictures');
    final uploadTask = storageRef.child('${DateTime.now()}.jpg').putFile(imageFile);
    final snapshot = await uploadTask;

    if (snapshot.state == TaskState.success) {
      final downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } else {
      throw Exception('Image upload failed');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainPrimaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              elevation: 10,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: const BoxDecoration(
                  color: kDarkRed,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft, // This aligns the child to the top-left corner
                  child: Padding(
                    padding: EdgeInsets.only(top: 85, left: 115), // Adjust the top and left padding to position the text
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _guardController.currentUser != null ? _guardController.currentUser!.name : '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          _guardController.currentUser != null ? _guardController.currentUser!.userType : '',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )




              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 30,
            child: CircleAvatar(
              radius: 34,
              backgroundImage: pickedImage != null
                  ? FileImage(pickedImage!)
                  : pickedImagePath != null
                  ? NetworkImage(pickedImagePath!)
                  : user != null && user!.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : const AssetImage('assets/loginLogo.png') as ImageProvider<Object>?,
            ),
          ),
          const Positioned(
            top: 5,
            left: 30,
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      updateProfilePicture2();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.camera_alt, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Change Profile Picture',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewUsersPage()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.people, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'View Users',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,MaterialPageRoute(builder: (context) => TermsandConditions()));// Perform action for button 3
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.pending_actions, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Terms & Condition',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,MaterialPageRoute(builder: (context) => PrivacyPolicy()));// Perform action for button 4
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.policy, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      AuthenticationRepository.instance.logout();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Log out',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
