import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';
import 'package:appdevelopment/screens/faculty/ui/add_ui/select_course_page.dart';


import '../../models/floor_model.dart';
import '../../utils/selection_variables.dart';

class SelectFloorPage extends StatelessWidget {
  const SelectFloorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Floor'),
      ),
      body: FutureBuilder<List<Floor>>(
        future: FirestoreUtils.getFloorsByBuilding(SelectedBuilding.buildingId ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error retrieving floors'),
            );
          } else {
            final floors = snapshot.data ?? [];
            return ListView.builder(
              itemCount: floors.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(floors[index].floorName),
                  onTap: () {
                    SelectedFloor.floorId = floors[index].floorId;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SelectCoursePage()),
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