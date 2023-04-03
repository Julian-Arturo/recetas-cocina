import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:receta_cocina/controller/logic_controller.dart';
import 'package:receta_cocina/widget/custom_logo.dart';
import 'package:receta_cocina/widget/form_login.dart';
import 'package:receta_cocina/widget/form_register.dart';
import 'package:receta_cocina/widget/login_form_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const buttons = [
      LoginFormButton(text: 'Ingresar', formType: FormType.loginCtrl),
      LoginFormButton(text: 'Registro', formType: FormType.registerCtrl),
    ];

    final formTypeCrtl = Provider.of<LogicController>(context);
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
              LoginFormButtonGroup(
                selectedFormType: formTypeCrtl.formType,
                buttons: buttons,
                onTap: (formType) => formTypeCrtl.showForm(formType),
              ),
              formTypeCrtl.formType == FormType.loginCtrl
                  ? FormLogin()
                  : const FormRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
