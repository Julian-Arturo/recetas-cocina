import 'dart:convert';

class MealResponse {
  MealResponse({
    required this.meals,
  });

  List<Meal> meals;

  factory MealResponse.fromJson(String str) =>
      MealResponse.fromMap(json.decode(str));

  factory MealResponse.fromMap(Map<String, dynamic> json) => MealResponse(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromMap(x))),
      );
}

class Meal {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String image;
  final String video;

  final List<String> ingredients;

  Meal({
    required this.video,
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.image,
    required this.ingredients,
  });

  factory Meal.fromJson(String str) => Meal.fromMap(json.decode(str));

  factory Meal.fromMap(Map<String, dynamic> json) => Meal( video: json["strYoutube"],
        id: json["idMeal"],
        name: json["strMeal"],
        category: json["strCategory"],
        area: json["strArea"],
        instructions: json["strInstructions"],
        image: json["strMealThumb"],
        ingredients: List<String>.from(List.generate(
            20, (index) => json['strIngredient${index + 1}'] as String? ?? '')
          ..removeWhere((element) => element.isEmpty)),
      );
}
