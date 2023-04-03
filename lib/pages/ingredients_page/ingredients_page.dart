import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/models/meal_response.dart';
import 'package:receta_cocina/utils/size_desing.dart';
import 'package:receta_cocina/widget/content_ingredients.dart';

import '../../services/Provider/service_data.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ServiceData>(context);
    final mealId =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "no-id";
    Meal? meals = item.getMealsIngredients(mealId);
    Responsive size = Responsive(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: ContentIngredients(meals: meals, size: size),
      ),
    );
  }
}
