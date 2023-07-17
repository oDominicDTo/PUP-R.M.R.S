import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/prof_terms_and_conditions.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/prof_privacy_policy.dart';
import 'package:appdevelopment/constants.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io' show File;

class ProfSettings extends StatefulWidget {
  const ProfSettings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfSettingsState();
}

class _ProfSettingsState extends State<ProfSettings> {
  final picker = ImagePicker();
  User? user;
  File? pickedImage;
  String? imageUrl;
  String? pickedImagePath;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
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
  Future<void> updateProfilePicture() async {
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
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 174,
              decoration: BoxDecoration(
                color: kDarkRed,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
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
            top: 90,
            left: 120,
            child: Text(
              'User name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
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
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap:(){
                      updateProfilePicture();
                    },

                    child: Container(
                      width: 372, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
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
                              'Change/Upload Profile Picture',
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
                      // Perform action for button 2
                      Navigator.push(
                          context,MaterialPageRoute(builder: (context) => TermsandConditions()));// Perform action for button 2
                    },
                    child: Container(
                      width: 372, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
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
                          context,MaterialPageRoute(builder: (context) => PrivacyPolicy()));// Perform action for button 3
                     },
                    child: Container(
                      width: 372, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
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
                      width: 372, // Adjust the width as needed
                      height: 50, // Adjust the height as needed
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
