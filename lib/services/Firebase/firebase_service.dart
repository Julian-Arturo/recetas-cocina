import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:receta_cocina/firebase_options.dart';

class FirebaseServices {
  static late FirebaseAuth auth;
  static late FirebaseFirestore db;
  static late FirebaseApp firebaseApp;
  static late BuildContext context;

  FirebaseServices(FirebaseAuth instance);

  static Future<void> initServices() async {
    firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    auth = FirebaseAuth.instanceFor(app: firebaseApp);
    db = FirebaseFirestore.instanceFor(app: firebaseApp);
  }


  
}
