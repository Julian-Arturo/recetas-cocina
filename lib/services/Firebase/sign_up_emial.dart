// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:receta_cocina/services/Firebase/firebase_service.dart';
import 'package:receta_cocina/widget/loading.dart';

class SignUpEmail extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  Future<void> signUpWhitEmail(BuildContext context) async {
    if (emailCtrl.text.isNotEmpty) {
      try {
        Loading.loadingCircle(context: context);

        UserCredential credential =
            await FirebaseServices.auth.createUserWithEmailAndPassword(
          email: emailCtrl.text,
          password: passCtrl.text,
        );

        if (credential.user != null) {
          await FirebaseServices.db
              .collection("user")
              .doc(credential.user!.uid)
              .set({
            "register_date": DateTime.now(),
            "email": emailCtrl.text,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              dismissDirection: DismissDirection.up,
              content: Text('Se ha registrado correctamente'),
            ),
          );
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
}
