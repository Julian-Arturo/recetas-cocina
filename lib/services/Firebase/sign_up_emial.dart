// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:receta_cocina/services/Firebase/firebase_service.dart';
import 'package:receta_cocina/widget/loading.dart';

abstract class SignUpFactory {
  Widget buildEmailField(TextEditingController emailCtrl);
  Widget buildPasswordField(TextEditingController passCtrl);
  Future<void> signUp(BuildContext context, TextEditingController emailCtrl,
      TextEditingController passCtrl);
}

class EmailSignUpFactory implements SignUpFactory {
  @override
  Widget buildEmailField(TextEditingController emailCtrl) {
    return TextFormField(
      controller: emailCtrl,
      decoration: const InputDecoration(
        labelText: 'Correo electrónico',
      ),
    );
  }

  @override
  Widget buildPasswordField(TextEditingController passCtrl) {
    return TextFormField(
      controller: passCtrl,
      decoration: const InputDecoration(
        labelText: 'Contraseña',
      ),
    );
  }

  @override
  Future<void> signUp(BuildContext context, TextEditingController emailCtrl,
      TextEditingController passCtrl) async {
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
          content: Text('Error, Ingrese un correo electrónico'),
        ),
      );
    }
  }
}

class SignUpEmail extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final SignUpFactory _factory;

  SignUpEmail(this._factory);

  void signUpWhitEmail(BuildContext context) async {
    await _factory.signUp(context, emailCtrl, passCtrl);
  }

  Widget buildEmailField() {
    return _factory.buildEmailField(emailCtrl);
  }

  Widget buildPasswordField() {
    return _factory.buildPasswordField(passCtrl);
  }
}
