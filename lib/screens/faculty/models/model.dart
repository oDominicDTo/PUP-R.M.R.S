class Room {
  // Properties of a room
}

class Course {
  // Properties of a course
}

class Subject {
  // Properties of a subject
}

class Professor {
  // Properties of a professor
}

class Reservation {
  Room room;
  Course course;
  Subject subject;
  Professor professor;
  DateTime initialTime;
  DateTime finalTime;

  Reservation({
    required this.room,
    required this.course,
    required this.subject,
    required this.professor,
    required this.initialTime,
    required this.finalTime,
  });
}
