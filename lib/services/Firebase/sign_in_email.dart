// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:receta_cocina/services/Firebase/firebase_service.dart';
import 'package:receta_cocina/widget/loading.dart';

class SingInEmail extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  static User? userdata;
  dynamic data;
  String? email = "";

  SingInEmail() {
    getData();
  }

  Future<void> signInEmail(BuildContext context) async {
    if (emailCtrl.text.isNotEmpty) {
      Loading.loadingCircle(context: context);

      try {
        final credential =
            await FirebaseServices.auth.signInWithEmailAndPassword(
          email: emailCtrl.text,
          password: passCtrl.text,
        );

        if (credential.user != null) {
          userdata = credential.user;
          final snapshot =
              await firestore.collection("user").doc(userdata!.uid).get();
          data = snapshot.data();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              dismissDirection: DismissDirection.up,
              content: Text('Has ingresado correctamente'),
            ),
          );

          await FirebaseServices.db
              .collection("user")
              .doc(credential.user!.uid)
              .get();

          Navigator.pushReplacementNamed(context, "navbar");
        }
        notifyListeners();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            dismissDirection: DismissDirection.endToStart,
            content: Text('Error, usuario o contraseña incorrecto'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.endToStart,
          content: Text('Error, Ingrese un correo electronico'),
        ),
      );
    }
  }

  Future<void> signOutUser(BuildContext context) async {
    FirebaseServices.auth.signOut();
    Navigator.pushReplacementNamed(context, "login");
  }

  Future<void> getData() async {
    final user = FirebaseServices.auth.currentUser!;
    var snapshot = await firestore.collection("user").doc(user.uid).get();
    data = snapshot.data();

    email = data['email'];
  }
}
