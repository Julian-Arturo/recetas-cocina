import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/models/meal_response.dart';
import 'package:receta_cocina/utils/size_desing.dart';

import '../services/Provider/service_data.dart';

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
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  children: const [
                    Image(
                      width: 30,
                      image: AssetImage("assets/img/youtube.png"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Youtube",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 50),
                child: Hero(
                  tag: meals.id,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(meals.image),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFF785B),
                    borderRadius: BorderRadius.circular(10)),
                width: size.height * 0.3,
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  meals.name,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ingredientes",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Instrucciones",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(meals.instructions)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
