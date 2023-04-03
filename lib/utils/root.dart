import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/controller/logic_controller.dart';
import 'package:receta_cocina/pages/splash_page/splash_page.dart';
import 'package:receta_cocina/widget/navigator_bar.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<LogicController>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.userStreamController.stream,
      builder: (context, snapshot) {
        // aquí puedes manejar los diferentes estados de autenticación
        if (snapshot.hasData) {
          // el usuario está autenticado
          return const NavigatorCustomBar();
        } else {
          // el usuario no está autenticado
          return const SplashPage();
        }
      },
    );
  }
}
