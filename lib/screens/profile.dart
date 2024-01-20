import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "font3",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
