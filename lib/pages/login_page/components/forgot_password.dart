import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:receta_cocina/services/Firebase/sign_in_email.dart';
import 'package:receta_cocina/widget/custom_button.dart';
import 'package:receta_cocina/widget/custom_input.dart';
import 'package:receta_cocina/widget/custom_logo.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final singIn = Provider.of<SingInEmail>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomLogo(
                width: 200,
                src: "assets/img/logo_black.png",
              ),
              const Text(
                "¿Olvidate tu contraseña?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomInput(
                  color: const Color(0xffFEEEEE),
                  placerholder: 'email@email.com',
                  keyboardType: TextInputType.emailAddress,
                  textController: singIn.emailCtrl,
                ),
              ),
              CustomButton(
                colortext: Colors.white,
                color: const Color(0xffFA4A0C),
                text: "Enviar",
                ontap: () {
                  singIn.forgotPassword(context);
                },
                width: 200,
                height: 40,
                margin: const EdgeInsets.only(top: 10),
              ),
              CustomButton(
                colortext: const Color(0xffFA4A0C),
                color: Colors.white,
                border: Border.all(width: 1, color: const Color(0xffFA4A0C)),
                text: "Cancelar",
                ontap: () {
                  Navigator.pop(context);
                },
                width: 200,
                height: 40,
                margin: const EdgeInsets.only(top: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
