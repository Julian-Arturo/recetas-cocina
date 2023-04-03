import 'package:flutter/material.dart';
import 'package:receta_cocina/models/meal_response.dart';
import 'package:receta_cocina/utils/size_desing.dart';

class ContentIngredients extends StatelessWidget {
  const ContentIngredients({
    Key? key,
    required this.meals,
    required this.size,
  }) : super(key: key);

  final Meal meals;
  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          imageMeal(),
          titleMeal(),
          foodRecipe(),
        ],
      ),
    );
  }

  Container foodRecipe() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ingredientes",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          ingredientsList(),
          const SizedBox(
            height: 20,
          ),
          const Text("Instrucciones",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Text(meals.instructions)
        ],
      ),
    );
  }

  SizedBox ingredientsList() {
    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
        itemCount: meals.ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = meals.ingredients[index];
          return Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text("🛒 $ingredient"));
        },
      ),
    );
  }

  Container titleMeal() {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffFF785B),
          borderRadius: BorderRadius.circular(10)),
      width: size.height * 0.3,
      padding: const EdgeInsets.all(10),
      child: Center(
          child: Text(
        meals.name,
        style: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
      )),
    );
  }

  Container imageMeal() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 50),
      child: Hero(
        tag: meals.id,
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(meals.image),
        ),
      ),
    );
  }
}
