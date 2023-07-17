import 'package:appdevelopment/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/prof_terms_and_conditions.dart';
import 'package:appdevelopment/screens/faculty/ui/ui settings/prof_privacy_policy.dart';
import 'package:appdevelopment/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ProfSettings extends StatefulWidget {
  const ProfSettings({Key? key}) : super(key: key);

  @override
  _ProfSettingsState createState() => _ProfSettingsState();
}

class _ProfSettingsState extends State<ProfSettings> {
  File? _imageFile; // Variable to store the selected image

  // Function to handle image selection
  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
      }
    });
  }

  // Function to update the profile picture
  //void _updateProfilePicture() async {
   // if (_imageFile != null) {
      // 1. Upload the image to Firebase Storage or your preferred storage solution

      //final Reference storageReference = FirebaseStorage.instance.ref().child('profile_pictures/user_id.jpg');
    //  final UploadTask uploadTask = storageReference.putFile(_imageFile!);
     // final TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);

      // 2. Get the download URL of the uploaded image

     // final String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();

      // 3. Update the user's profile picture URL in the database or user model
      // Replace this with your own implementation based on your data structure
      // For example, if you're using Firebase Realtime Database:
      // await FirebaseDatabase.instance.reference().child('users/user_id/profile_picture').set(downloadURL);
      // Or if you're using Cloud Firestore:
      // await FirebaseFirestore.instance.collection('users').doc('user_id').update({'profile_picture': downloadURL});

      // 4. Optionally, you can update the UI to reflect the new profile picture
    //  setState(() {
        // Update the UI here, e.g., by assigning the downloadURL to a profilePictureURL variable
    //  });
  //  }
  //}

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
              backgroundImage: _imageFile != null
                  ? FileImage(_imageFile!)
                  : AssetImage('assets/professor_image.png') as ImageProvider<Object>,
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
                    onTap:_selectImage,

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
