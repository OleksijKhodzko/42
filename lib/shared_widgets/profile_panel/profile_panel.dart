import 'package:flutter/material.dart';

class ProfilePanel extends StatelessWidget {
  const ProfilePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 255,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/default_user_avatar.png'),
            ),
          ),
          title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'F0xy13',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'petka23@gmail.com',
                  style: TextStyle(fontSize: 16, color: Colors.white54),
                ),
              ]),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 13),
          children: [
            ListTile(
              leading: const Icon(Icons.account_circle, size: 30),
              title: const Text('Профіль'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/grades/profile_panel/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.school, size: 30),
              title: const Text('Список курсів'),
              onTap: () {
                // TO DO
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.query_stats, size: 30),
              title: const Text('Статистика'),
              onTap: () {
                // TO DO
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on, size: 30),
              title: const Text('Преміум підписка'),
              onTap: () {
                // TO DO
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, size: 30),
              title: const Text('Налаштування'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/grades/profile_panel/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_mark, size: 30),
              title: const Text('Інформація'),
              onTap: () {
                // TO DO
                Navigator.pop(context);
              },
            ),
          ],
        ),
        bottomSheet: Container(
            color: Colors.white,
            height: 100,
            child: const Center(
              child: Text(
                'V-1.0.0',
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 156, 160, 161)),
              ),
            )),
      ),
    );
  }
}
