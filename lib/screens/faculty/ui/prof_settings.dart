import 'package:flutter/material.dart';
import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:appdevelopment/screens/faculty/ui/ui settings/terms_and_conditions.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/privacy_policy.dart';
import 'package:appdevelopment/constants.dart';
import 'package:appdevelopment/screens/faculty/controller/professor_controller.dart';

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
  File? _localPickedImage;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    loadPickedImage(); // Load the picked image path from Firestore
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
          _localPickedImage = null;
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
        _localPickedImage = null;
        pickedImagePath = null;
      });
    }
  }

  void _showRemoveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Profile Picture'),
          content: const Text('Are you sure you want to remove your profile picture?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                removeProfilePicture();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Remove'),
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
        ? MediaQuery.of(context).size.height * 0.25
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
                          left: isPortrait ? MediaQuery.of(context).size.width * 0.32 : MediaQuery.of(context).size.width * 0.2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder(
                              future: _professorController.loadUserData(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Container(); // Return an empty container while waiting for data
                                } else if (snapshot.hasError) {
                                  return Container(); // Handle error gracefully
                                } else {
                                  // Once user data is loaded, display the user name and user type
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _professorController.currentUser?.name ?? '',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        _professorController.currentUser?.userType ?? '',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
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
                          CachedNetworkImage(
                            imageUrl: pickedImagePath ?? '',
                            imageBuilder: (context, imageProvider) => CircleAvatar(
                              radius: avatarSize,
                              backgroundImage: _localPickedImage != null
                                  ? FileImage(_localPickedImage!)
                                  : imageProvider,
                            ),
                            placeholder: (context, url) => CircleAvatar(
                              radius: avatarSize,
                              backgroundColor: Colors.grey, // Placeholder color while loading the image
                            ),
                            errorWidget: (context, url, error) => CircleAvatar(
                              radius: avatarSize,
                              backgroundImage: const AssetImage('assets/loginLogo.png'), // Show a default image if there's an error loading the image
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // Show a bottom sheet for profile picture actions
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text('Upload Profile Picture'),
                                            onTap: () {
                                              updateProfilePicture();
                                              Navigator.pop(context); // Close the bottom sheet after choosing an option
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.remove_circle),
                                            title: Text('Remove Profile Picture'),
                                            onTap: () {
                                              Navigator.pop(context); // Close the bottom sheet first
                                              _showRemoveConfirmationDialog(); // Show the confirmation dialog
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 25),
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
          ],
        ),
      ),
    );
  }
}
