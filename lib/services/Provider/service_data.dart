import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:receta_cocina/helpers/debouncer.dart';
import 'package:receta_cocina/models/category_response.dart';
import 'package:receta_cocina/models/meal_response.dart';

class ServiceData extends ChangeNotifier {
  static const String baseUrl = "www.themealdb.com";
  List<Category> btnCategory = [];
  List<Meal> meals = [];
  bool error = false;

  Logger logger = Logger();

  final StreamController<List<Meal>> streamController =
      StreamController.broadcast();

  Stream<List<Meal>> get stream => streamController.stream;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 350),
  );

  ServiceData() {
    print("Service data inicializado");
    getData();
  }

  Future<void> getData() async {
    await getOnCategoryData();
    await getOnMealData();
  }

  Future<void> getOnCategoryData() async {
    try {
      var url = Uri.https(baseUrl, 'api/json/v1/1/categories.php');
      final response = await http.get(url);

      final categoryResponse = CategoryResponse.fromJson(response.body);
      btnCategory = categoryResponse.categories;
      notifyListeners();
    } catch (e) {
      error = true;
      notifyListeners();

      logger.i('Error al obtener las categorías: $e');
    }
  }

  Future<void> getOnMealData({String? querySearch}) async {
    try {
      var url = Uri.https(baseUrl, 'api/json/v1/1/search.php', {"s": " "});
      final response = await http.get(url);
      final mealResponse = MealResponse.fromJson(response.body);
      meals = mealResponse.meals;
      notifyListeners();
    } catch (e) {
      error = true;
      notifyListeners();

      logger.i('Error al obtener las Meal data: $e');
    }
  }

  Future<List<Meal>> searchMealData({String? querySearch}) async {
    try {
      var url =
          Uri.https(baseUrl, 'api/json/v1/1/search.php', {"s": querySearch});
      final response = await http.get(url);
      final mealResponse = MealResponse.fromJson(response.body);
      notifyListeners();
      return mealResponse.meals;
    } catch (e) {
      error = true;
      notifyListeners();
      rethrow;
    }
  }

  List<Meal> getFilteredMeals(String categoryName) {
    return meals.where((meal) => meal.category == categoryName).toList();
  }

  Meal getMealsIngredients(String idMeal) {
    return meals.firstWhere((meal) => meal.id == idMeal);
  }

  void getQueryString(String search) {
    debouncer.value = "";
    debouncer.onValue = (value) async {
      final result = await searchMealData(querySearch: value);
      streamController.add(result);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = search;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
