import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isInteractive = false;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  bool? _toggled;

  @override
  void initState(){
    super.initState();
    _loadState();
  }

  Future<void> _loadState() async {
    _toggled = (await getBoolFromCache('interactive_lesson')) ?? false;
    setState(() {});
  }

  Future<void> saveBoolToCache(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool?> getBoolFromCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 123, 226),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Account Settings', style: TextStyle(fontSize: 25, color: Colors.black),),
      ),
      body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0), 
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                //color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(12.0), 
              ),
              child: SwitchListTile(
                  title: const Text('Інтерактивний текст уроків'),
                  value: _toggled!,
                  onChanged: (value) {
                    setState(() {
                      _toggled = value;
                    });
                    saveBoolToCache('interactive_lesson', _toggled!);
                  },
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.grey,
              ),
            ),  
          ],
      ),
    );
  }
}