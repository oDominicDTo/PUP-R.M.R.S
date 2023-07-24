import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/ui/add_ui/select_subject_page.dart';

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
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              color: Colors.grey,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                      child: Container(
                        color: const Color(0xFF5B0101),
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 160,
              left: 20,
              right: 20,
              bottom: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Choose Course",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: FutureBuilder<List<Course>>(
                          future: FirestoreUtils.getCoursesByProfessor(professorId),
                          builder: (context, snapshot) {
                            print("Snapshot Data: ${snapshot.data}");
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
                                  return Center(
                                    child: Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        title: Text(courses[index].courseName),
                                        subtitle: Text(courses[index].courseColor),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SelectSubjectPage(
                                                courseId: courses[index].courseId,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
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
