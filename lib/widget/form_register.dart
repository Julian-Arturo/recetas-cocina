import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/services/Firebase/sign_up_emial.dart';
import 'package:receta_cocina/widget/custom_button.dart';
import 'package:receta_cocina/widget/custom_input.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  @override
  Widget build(BuildContext context) {
    final singUp = Provider.of<SignUpEmail>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            color: const Color(0xffFEEEEE),
            placerholder: 'email@email.com',
            keyboardType: TextInputType.emailAddress,
            textController: singUp.emailCtrl,
          ),
          CustomInput(
            color: const Color(0xffFEEEEE),
            placerholder: '*******',
            textController: singUp.passCtrl,
            isPassword: true,
          ),
          CustomButton(
            text: "Iniciar Sesion",
            ontap: () {
              singUp.signUpWhitEmail(context);
            },
            width: 200,
            height: 50,
            margin: const EdgeInsets.only(top: 10),
          )
        ],
      ),
    );
  }
}
