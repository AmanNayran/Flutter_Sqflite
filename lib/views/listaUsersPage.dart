import 'package:flutter/material.dart';

import '../db/db.dart';

class MyListUsersPage extends StatefulWidget {
  const MyListUsersPage({super.key});

  @override
  State<MyListUsersPage> createState() => _MyListUsersPageState();
}

class _MyListUsersPageState extends State<MyListUsersPage> {
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    saveUsers();
  }

  Future<void> saveUsers() async {
    final users = await getUsers();
    setState(() {
      _users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 70, left: 70, right: 70),
          child: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return ListTile(
                title: Text(user['username']),
                subtitle: Text(user['senha']),
              );
            },
          ),
        ),
      )
    );
  }
}