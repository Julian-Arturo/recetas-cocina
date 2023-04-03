import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/services/Provider/service_data.dart';
import 'package:receta_cocina/utils/size_desing.dart';
import 'package:receta_cocina/widget/filter_category.dart';

import '../models/meal_response.dart';

class MealSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Buscar receta";

  Widget emptyIcon(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.food_bank_rounded,
        color: Colors.orange,
        size: 150,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
        query = "";
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final meals = Provider.of<ServiceData>(context, listen: false);
    Responsive size = Responsive(context);
    return FutureBuilder<List<Meal>>(
      future: meals.searchMealData(querySearch: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Container(
              width: size.width * 0.5,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xffFA4A0C),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'No se encontraron resultados',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: size.height * 0.9,
            child: FilterCategory(
              mealList: snapshot.data!,
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final meals = Provider.of<ServiceData>(context, listen: false);
    Responsive size = Responsive(context);
    meals.searchMealData(querySearch: query);
    meals.getQueryString(query);

    if (query.isEmpty) {
      return emptyIcon(context);
    }

    return StreamBuilder(
      stream: meals.stream,
      builder: (context, AsyncSnapshot<List<Meal>> snapshot) {
        if (!snapshot.hasData) return emptyIcon(context);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: size.height * 0.9,
          child: FilterCategory(
            mealList: snapshot.data!,
          ),
        );
      },
    );
  }
}
