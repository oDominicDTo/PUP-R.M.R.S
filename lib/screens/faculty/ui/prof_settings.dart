import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/terms_and_conditions.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/privacy_policy.dart';
import 'package:appdevelopment/constants.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:appdevelopment/screens/faculty/controller/professor_controller.dart';
import 'dart:io' show File;

class ProfSettings extends StatefulWidget {
  const ProfSettings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfSettingsState();
}

class _ProfSettingsState extends State<ProfSettings> {
  final ReservationController _professorController = ReservationController();
  final picker = ImagePicker();
  User? user;
  File? pickedImage;
  String? imageUrl;
  String? pickedImagePath;
  double _circleAvatarScale = 1.0;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _professorController.loadUserData();
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
  void removeProfilePicture() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final collectionRef = FirebaseFirestore.instance.collection('users');
      final documentRef = collectionRef.doc(user.uid);

      await documentRef.update({
        'profilePicture': null,
      });

      setState(() {
        pickedImage = null;
        pickedImagePath = null;
      });
    }
  }
  void _showRemoveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Profile Picture'),
          content: Text('Are you sure you want to remove your profile picture?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                removeProfilePicture();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double headerHeight = isPortrait
        ? MediaQuery.of(context).size.height * 0.22
        : MediaQuery.of(context).size.width * 0.22;

    final double avatarSize = MediaQuery.of(context).size.shortestSide * 0.11;

    return Scaffold(
      backgroundColor: kMainPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                    height: headerHeight,
                    decoration: const BoxDecoration(
                      color: kDarkRed,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: headerHeight * 0.5,
                          left: isPortrait ? MediaQuery.of(context).size.width * 0.3 : MediaQuery.of(context).size.width * 0.2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _professorController.currentUser != null
                                  ? _professorController.currentUser!.name
                                  : '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              _professorController.currentUser != null
                                  ? _professorController.currentUser!.userType
                                  : '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: headerHeight * 0.4,
                  left: isPortrait ? MediaQuery.of(context).size.width * 0.06 : MediaQuery.of(context).size.width * 0.06,
                  child: Transform.scale(
                    scale: _circleAvatarScale,
                    child: GestureDetector(
                      onScaleUpdate: (details) {
                        setState(() {
                          _circleAvatarScale = details.scale;
                        });
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: avatarSize,
                            backgroundImage: pickedImage != null
                                ? FileImage(pickedImage!)
                                : pickedImagePath != null
                                ? NetworkImage(pickedImagePath!)
                                : user != null && user!.photoURL != null
                                ? NetworkImage(user!.photoURL!)
                                : const AssetImage('assets/loginLogo.png') as ImageProvider<Object>?,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _showRemoveConfirmationDialog(); // Show the confirmation popup
                              },
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: headerHeight * 0.1,
                  left: isPortrait ? MediaQuery.of(context).size.width * 0.05 : MediaQuery.of(context).size.width * 0.03,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: isPortrait ? 24 : 18,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      updateProfilePicture();
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsandConditions(),
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicy(),
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                  SizedBox(height: 15),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
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
          ],
        ),
      ),
    );
  }









}
