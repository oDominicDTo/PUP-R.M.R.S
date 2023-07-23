import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/utils/firestore_utils.dart';
import 'package:appdevelopment/screens/faculty/ui/add_ui/select_course_page.dart';

import '../../models/floor_model.dart';
import '../../utils/selection_variables.dart';

class SelectFloorPage extends StatelessWidget {
  const SelectFloorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace this list with your own texts for each box
    List<String> customTexts = [
      'Multimedia \n Room',
      'Room \n 201-205',
      'Room \n 301-305',
      'Comlab \n 1-3',
      // Add more texts as needed for each box
    ];

    // Define responsive grid aspect ratio
    double gridItemAspectRatio = 0.8830;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Floor'),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Floor>>(
        future: FirestoreUtils.getFloorsByBuilding(SelectedBuilding.buildingId!),
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
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Building A',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Determine the number of columns based on screen width
                      int columns = constraints.maxWidth > 600 ? 4 : 2;
                      // Calculate item width based on the number of columns and aspect ratio
                      double itemWidth = (constraints.maxWidth - (columns + 1) * 18) / columns;
                      // Calculate item height based on the aspect ratio
                      double itemHeight = itemWidth / gridItemAspectRatio;

                      return GridView.builder(
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 18   ,
                          mainAxisSpacing: 35,
                          childAspectRatio: gridItemAspectRatio,
                        ),
                        itemCount: floors.length,
                        itemBuilder: (context, index) {
                          String floorName = floors[index].floorName;
                          String customText = index < customTexts.length ? customTexts[index] : 'Default Custom Text';

                          // Find the index of the word "floor"
                          int floorIndex = floorName.indexOf("Floor");

                          return GestureDetector(
                            onTap: () {
                              SelectedFloor.floorId = floors[index].floorId;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SelectCoursePage()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                color: const Color(0xFF5B0101),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: Alignment.center, // Center the RichText
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: floorName.substring(0, floorIndex), // Text before "floor"
                                            style: TextStyle(
                                              color: const Color(0xF0F0F0F0),
                                              fontSize: 45,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '\n' + "Floor", // Add a line break before "Floor"
                                            style: TextStyle(
                                              color: const Color(0xF0F0F0F0),
                                              fontSize: 30, // Font size for the word "floor"
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    width: itemWidth * 1.1,
                                    height: itemHeight * 0.35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          offset: const Offset(0, 3),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        customText,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );



                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
