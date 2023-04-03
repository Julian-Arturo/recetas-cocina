import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/controller/logic_controller.dart';
import 'package:receta_cocina/routes/routes.dart';
import 'package:receta_cocina/services/Firebase/firebase_service.dart';
import 'package:receta_cocina/services/Firebase/sign_in_email.dart';
import 'package:receta_cocina/services/Firebase/sign_up_emial.dart';
import 'package:receta_cocina/services/Provider/service_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServices.initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LogicController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SingInEmail(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpEmail(),
        ),
        ChangeNotifierProvider(
          create: (_) => ServiceData(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'init',
        routes: appRoutes,
      ),
    );
  }
}
