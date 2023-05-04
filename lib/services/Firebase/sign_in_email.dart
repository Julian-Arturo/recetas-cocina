// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:receta_cocina/services/Firebase/firebase_service.dart';
import 'package:receta_cocina/widget/loading.dart';
//TODO Implementacion de Factory 
abstract class Authentication {
  Future<void> signInEmail(BuildContext context);
  Future<void> signOff(BuildContext context);
  Future<void> forgotPassword(BuildContext context);
}

class AuthenticationFactory {
  static Authentication create() {
    return SingInEmail();
  }
}

class SingInEmail implements Authentication {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  static User? userdata;
  dynamic data;

  @override
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
      } catch (e) {
        Navigator.of(context).pop();

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

  @override
  Future<void> signOff(BuildContext context) async {
    FirebaseServices.auth.signOut();
    Navigator.pushReplacementNamed(context, "login");
  }

  @override
  Future<void> forgotPassword(BuildContext context) async {
    await FirebaseServices.auth.sendPasswordResetEmail(email: emailCtrl.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.endToStart,
        content: Text('Te hemos enviado un correo electrónico'),
      ),
    );
    Navigator.pushReplacementNamed(context, "login");
  }
}
