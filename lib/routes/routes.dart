import 'package:flutter/material.dart';
import 'package:receta_cocina/pages/category_page/category_page.dart';
import 'package:receta_cocina/pages/home_page/home_page.dart';
import 'package:receta_cocina/pages/ingredients_page/ingredients_page.dart';
import 'package:receta_cocina/pages/login_page/components/forgot_password.dart';
import 'package:receta_cocina/pages/login_page/login_page.dart';
import 'package:receta_cocina/pages/perfil_page/perfil_page.dart';
import 'package:receta_cocina/pages/splash_page/splash_page.dart';
import 'package:receta_cocina/utils/root.dart';
import 'package:receta_cocina/widget/navigator_bar.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  "splash": (_) => const SplashPage(),
  "login": (_) => const LoginPage(),
  "home": (_) => const HomePage(),
  "category": (_) => const CategoryPage(),
  "perfil": (_) => const PerfilPage(),
  "ingredients": (_) => const IngredientsPage(),
  "password": (_) => const ForgotPassword(),
  "navbar": (_) => const NavigatorCustomBar(),
  "init": (_) => const Root()
};
