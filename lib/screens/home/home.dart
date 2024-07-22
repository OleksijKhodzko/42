import 'package:flutter/material.dart';
import 'package:fortytwo/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
          onPressed: () {
            _auth.signOut();
          },
          child: const Icon(Icons.exit_to_app),
        )
      ]),
      body: const Text('home'),
    );
  }
}
