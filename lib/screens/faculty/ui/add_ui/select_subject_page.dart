import 'package:appdevelopment/screens/faculty/ui/add_ui/select_room_page.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/models/subject_model.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';

class SelectSubjectPage extends StatelessWidget {
  const SelectSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Subject'),
      ),
      backgroundColor: Colors.white, // Set the background color here
      body: FutureBuilder<List<Subject>>(
        future: FirestoreUtils.getSubjectsByCourse('bsit'),
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
                      MaterialPageRoute(builder: (context) => const SelectRoomPage()),
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
}
