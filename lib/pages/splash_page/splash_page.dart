import 'package:flutter/material.dart';

import 'package:receta_cocina/widget/custom_button.dart';
import 'package:receta_cocina/widget/custom_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CustomLogo(
                  width: 350,
                  src: "assets/img/logo_name.png",
                  margin: EdgeInsets.only(top: 40),
                ),
                CustomButton(
                  colortext: Colors.white,
                  color: const Color(0xffFA4A0C),
                  margin: const EdgeInsets.only(bottom: 70),
                  text: "Iniciar",
                  ontap: () => Navigator.pushReplacementNamed(context, "login"),
                  width: 140,
                  height: 55,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
