import 'package:flutter/material.dart';
import 'package:receta_cocina/services/Firebase/sign_in_email.dart';
import 'package:receta_cocina/utils/size_desing.dart';
import 'package:receta_cocina/widget/custom_button.dart';

class CustomPerfil extends StatelessWidget {
  const CustomPerfil({
    Key? key,
    required this.size,
    required this.auth,
    required this.email,
  }) : super(key: key);

  final Responsive size;
  final SingInEmail auth;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(),
        perfilAvatar(),
        emailUser(),
        CustomButton(
          colortext: Colors.white,
          color: const Color(0xffFA4A0C),
          margin: const EdgeInsets.only(top: 70),
          text: "Cerrar sesion",
          ontap: () {
            auth.signOff(context);
          },
          width: 200,
          height: 40,
        ),
      ],
    );
  }

  Container emailUser() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      decoration: BoxDecoration(
          color: const Color(0xffFEEEEE),
          borderRadius: BorderRadius.circular(10)),
      width: size.height * 0.4,
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Text(
          email,
          style: const TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Container perfilAvatar() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      width: size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(200),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 7),
                blurRadius: 5),
          ]),
      child: FadeInImage(
        width: size.diagonal * 0.1,
        image: const AssetImage("assets/img/logo_black.png"),
        placeholder: const AssetImage("assets/img/load-loading.gif"),
        // backgroundImage:
      ),
    );
  }

  Container appBar() {
    return Container(
      width: double.infinity,
      height: 50,
      color: const Color(0xffFF785B),
      child: const Center(
        child: Text(
          "Mi perfil",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
