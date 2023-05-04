import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/services/Firebase/sign_in_email.dart';
import 'package:receta_cocina/widget/custom_button.dart';
import 'package:receta_cocina/widget/custom_input.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signIn = SingInEmail();
    return ScaffoldMessenger(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInput(
                color: const Color(0xffFEEEEE),
                placeholder: 'Correo electrónico',
                keyboardType: TextInputType.emailAddress,
                textController: signIn.emailCtrl,
              ),
              CustomInput(
                color: const Color(0xffFEEEEE),
                placeholder: 'Contraseña',
                textController: signIn.passCtrl,
                isPassword: true,
              ),
              TextButton(
                onPressed: () {
                  signIn.forgotPassword(context);
                },
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              CustomButton(
                colortext: Colors.white,
                color: const Color(0xffFA4A0C),
                text: 'Iniciar sesión',
                ontap: () {
                  signIn.signInEmail(context);
                },
                width: 200,
                height: 50,
                margin: const EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
