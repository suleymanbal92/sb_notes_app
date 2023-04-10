import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sbnotesapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NoteHome());
}

class NoteHome extends StatelessWidget {
  const NoteHome({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('notes')
        .doc('note1')
        .set({'title': 'Note 1', 'content': 'This is note 1'});

    return MaterialApp(
        title: 'SB Notes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('SB Notes'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ));
  }
}
