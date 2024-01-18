import 'package:firechat/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("HomePage"),
      actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
    ));
  }

  void logout() {
    final _auth = AuthServices();
    _auth.signOut();
  }
}
