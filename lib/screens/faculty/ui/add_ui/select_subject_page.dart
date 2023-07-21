import 'package:appdevelopment/screens/faculty/ui/add_ui/select_room_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        body: FutureBuilder<List<Subject>>(
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
                  return ListTile(
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
                          builder: (context) =>
                              SelectRoomPage(

                                subjectId: subject.subjectId,
                                professorId: subject.professorId,
                                courseId: courseId,
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
    }
    // Return a placeholder widget or handle the case when user is null
    return const Scaffold(
    body: Center(
    child: CircularProgressIndicator(),
    ),
    );
  }
}