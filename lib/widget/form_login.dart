import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/services/Firebase/sign_in_email.dart';
import 'package:receta_cocina/widget/custom_button.dart';
import 'package:receta_cocina/widget/custom_input.dart';

class FormLogin extends StatefulWidget {
  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    final singIn = Provider.of<SingInEmail>(context);
    return ScaffoldMessenger(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInput(
                color: const Color(0xffFEEEEE),
                placerholder: 'email@email.com',
                keyboardType: TextInputType.emailAddress,
                textController: singIn.emailCtrl,
              ),
              CustomInput(
                color: const Color(0xffFEEEEE),
                placerholder: '*******',
                textController: singIn.passCtrl,
                isPassword: true,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Olvide mi contraseña",
                    style: TextStyle(color: Colors.black),
                  )),
              CustomButton(
                text: "Iniciar Sesion",
                ontap: () {
                  singIn.signInEmail(context);
                },
                width: 200,
                height: 50,
                margin: const EdgeInsets.only(top: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
