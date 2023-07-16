import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/faculty/models/model.dart';
import 'package:appdevelopment/screens/faculty/controller/professor_controller.dart';



class HomeProfessorPage extends StatefulWidget {
  const HomeProfessorPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeProfessorPageState();
}

class _HomeProfessorPageState extends State<HomeProfessorPage> {
  final ReservationController _reservationController = ReservationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reservations'),
      ),
      body: buildReservationList(),
    );
  }

  Widget buildReservationList() {
    return FutureBuilder<List<Reservation>>(
      future: _reservationController.getReservations(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error retrieving reservations'),
          );
        } else {
          final reservations = snapshot.data ?? [];
          return ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              return ReservationCard(reservation: reservations[index]);
            },
          );
        }
      },
    );
  }
}

class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  const ReservationCard({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipPath(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: reservation.courseColor,
                width: 10,
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 110,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${reservation.roomName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '   ${reservation.subject}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '   ${reservation.course}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${reservation.course}',
                      style: TextStyle(
                        fontSize: 15,
                        color: reservation.courseColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Stack(
                      children: [
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 1),
                          height: 20,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              '    ${reservation.initialTime.hour}:${reservation.initialTime.minute} - ${reservation.finalTime.hour}:${reservation.finalTime.minute}',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 6,
                          top: 2,
                          bottom: 10,
                          child: Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
