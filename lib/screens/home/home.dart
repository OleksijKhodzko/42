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
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            InkWell(
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/vector-1.png'),
                radius: 24,
              ),
            ),
            Expanded(
              flex: 60,
              child: Container(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {},
                child: const SizedBox(
                    width: 48, height: 48, child: Icon(Icons.search, size: 40)),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            // Expanded(
            //   flex: 20,
            //   child: IconButton(
            //     onPressed: () {
            //       _auth.signOut();
            //     },
            //     icon: const Icon(Icons.search, size: 40),
            //   ),
            // )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          children: [
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
