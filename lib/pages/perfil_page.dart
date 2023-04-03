import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/services/Firebase/sign_in_email.dart';
import 'package:receta_cocina/utils/size_desing.dart';
import 'package:receta_cocina/widget/custom_button.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);
    final auth = Provider.of<SingInEmail>(context);
    return Column(
      children: [
        Hero(
          tag: 1,
          child: Container(
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
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 20),
          width: size.width * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 7),
                    blurRadius: 5),
              ]),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 100,
            backgroundImage: AssetImage("assets/img/logo_black.png"),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              color: const Color(0xffFEEEEE),
              borderRadius: BorderRadius.circular(10)),
          width: size.height * 0.3,
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              auth.email!,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        CustomButton(
          margin: const EdgeInsets.only(top: 70),
          text: "Cerrar sesion",
          ontap: () {
            auth.signOutUser(context);
          },
          width: 200,
          height: 40,
        ),
      ],
    );
  }
}
