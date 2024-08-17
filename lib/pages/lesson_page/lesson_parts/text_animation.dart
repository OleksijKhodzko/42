import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LessonAnimation extends StatelessWidget {

  final String? ref;

  FirebaseStorage storage = FirebaseStorage.instance;
  String? illustrationURL;

  LessonAnimation({super.key, this.ref});

  Future<void> _getDownloadURL() async {
    try {
      illustrationURL = await storage.ref(ref).getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        
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
    );
  }
}