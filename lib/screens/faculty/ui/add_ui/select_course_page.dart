import 'package:appdevelopment/screens/faculty/ui/add_ui/select_subject_page.dart';
import 'package:flutter/material.dart';
import '../../utils/firestore_utils.dart';
import '../../models/course_model.dart';

class SelectCoursePage extends StatelessWidget {
  const SelectCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Course'),
      ),
      body: FutureBuilder<List<Course>>(
        future: FirestoreUtils.getCourses(),
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
  }
}
