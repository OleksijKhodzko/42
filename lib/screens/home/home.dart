import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/screens/home/avatar.dart';
import 'package:fortytwo/services/database.dart';
import 'package:fortytwo/shared/loading.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    UserObject? userObject = Provider.of<UserObject?>(context);
    if (userObject == null) return const Loading();
    final database = UserDatabase(uid: userObject.uid);
    if (database.userData == null) throw Exception('no users document');
    return StreamProvider<UserData?>.value(
      value: database.userData,
      initialData: null,
      child: Scaffold(
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
                  child: const UserAvatar()),
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
                      width: 48,
                      height: 48,
                      child: Icon(Icons.search, size: 40)),
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
      ),
    );
  }
}
