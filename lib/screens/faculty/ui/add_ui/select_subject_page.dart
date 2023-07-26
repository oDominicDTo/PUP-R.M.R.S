import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appdevelopment/screens/faculty/ui/add_ui/select_room_page.dart';
import 'package:appdevelopment/screens/faculty/models/subject_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';

class SelectSubjectPage extends StatelessWidget {
  final String courseId;

  SelectSubjectPage({required this.courseId, Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      final professorId = user!.uid;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Select Subject'),
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
                      const Text(
                        "Choose Subject",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: FutureBuilder<List<Subject>>(
                          future: FirestoreUtils.getSubjectsByCourse(courseId, professorId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text('Error retrieving subjects'),
                              );
                            } else {
                              final subjects = snapshot.data ?? [];
                              return ListView.builder(
                                itemCount: subjects.length,
                                itemBuilder: (context, index) {
                                  final subject = subjects[index];
                                  return Card(
                                    color: Colors.white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      title: Text(subject.subjectName),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Professor ID: ${subject.professorId}'),
                                          Text('Initial Time: ${subject.initialTime}'),
                                          Text('Final Time: ${subject.finalTime}'),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SelectRoomPage(
                                              subjectId: subject.subjectId,
                                              professorId: subject.professorId,
                                              courseId: courseId,
                                              selectedInitialTime: subject.initialTime,
                                              selectedFinalTime: subject.finalTime,
                                            ),
                                          ),
                                        );
                                      },
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
    }
    // Return a placeholder widget or handle the case when the user is null
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
