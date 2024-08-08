import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Account Settings', style: TextStyle(fontSize: 25, color: Colors.black),),
      ),
    );
  }
}