import 'package:cloud_firestore/cloud_firestore.dart';

class Floor {
  final String floorId;
  final String floorName;

  Floor({
    required this.floorId,
    required this.floorName,
  });

  factory Floor.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Floor(
      floorId: snapshot.id,
      floorName: data['floorName'],
    );
  }
}
