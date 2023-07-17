import 'package:flutter/material.dart';
import 'package:appdevelopment/screens/guard/models/room.dart';
import 'package:appdevelopment/screens/guard/repository/guard_repository.dart';
import 'package:appdevelopment/constants.dart';

class ViewUsersPage extends StatefulWidget {
  @override
  _ViewUsersPageState createState() => _ViewUsersPageState();
}

class _ViewUsersPageState extends State<ViewUsersPage> {
  UserRepository _userController = UserRepository();
  List<User> _professors = [];

  @override
  void initState() {
    super.initState();
    _loadProfessors();
  }

  Future<void> _loadProfessors() async {
    List<User> professors = await _userController.getProfessors();
    setState(() {
      _professors = professors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Professors'),
      ),
      body: Container(
        color: kMainPrimaryColor,
        child: ListView.builder(
          itemCount: _professors.length,
          itemBuilder: (context, index) {
            User professor = _professors[index];
            return ListTile(
              leading: CircleAvatar(
                // Set the profile picture here
                child: Text('P'),
              ),
              title: Text(professor.name),
              subtitle: Text(professor.email),
            );
          },
        ),
      ),
    );
  }
}
