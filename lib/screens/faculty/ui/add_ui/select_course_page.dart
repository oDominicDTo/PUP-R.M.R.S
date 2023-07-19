import 'package:appdevelopment/screens/faculty/ui/add_ui/select_subject_page.dart';
import 'package:flutter/material.dart';
import '../../utils/firestore_utils.dart';
import '../../models/course_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SelectCoursePage extends StatelessWidget {
  SelectCoursePage({Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      final professorId = user!.uid;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Select Course'),
        ),
        backgroundColor: Colors.white, // Set the background color here
        body: FutureBuilder<List<Course>>(
          future: FirestoreUtils.getCoursesByProfessor(professorId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error retrieving courses'),
              );
            } else {
              final courses = snapshot.data ?? [];
              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(courses[index].courseName),
                    subtitle: Text(courses[index].courseColor),
                    onTap: () {
                      // Handle course selection
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectSubjectPage(
                            courseId: courses[index].courseId,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      );
    } else {
      // Handle the case where the user is not authenticated (user is null)
      // You can navigate to a login screen or display a message here
      return Scaffold(
        appBar: AppBar(
          title: const Text('Select Course'),
        ),
        body: const Center(
          child: Text('Please log in to view courses.'),
        ),
      );
    }
  }
}
