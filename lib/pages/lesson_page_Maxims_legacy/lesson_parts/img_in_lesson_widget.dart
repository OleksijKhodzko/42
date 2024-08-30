import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class LessonIllustration extends StatelessWidget {

  final String? ref;

  FirebaseStorage storage = FirebaseStorage.instance;
  String? illustrationURL;

  LessonIllustration({super.key, this.ref});

  Future<void> _getDownloadURL() async {
    try {
      illustrationURL = await storage.ref(ref).getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
          child: FutureBuilder(
            future: _getDownloadURL(), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done){
                return Center(child: Image.network(illustrationURL!));
              }
              else if(snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator.adaptive();
              }
              else{
                return const Text('image is not found');
              }
            }
          )
      ),
    );
  }
}