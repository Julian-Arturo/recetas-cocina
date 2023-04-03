import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/models/meal_response.dart';
import 'package:receta_cocina/services/Provider/service_data.dart';
import 'package:receta_cocina/utils/size_desing.dart';
import 'package:receta_cocina/widget/filter_category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);
    final filterMeal = Provider.of<ServiceData>(context);

    final String category =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "no-category";
    List<Meal> meals = filterMeal.getFilteredMeals(category);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _CustomAppBar(nameCategory: category),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: size.height * 0.8,
                    child: meals.isNotEmpty
                        ? FilterCategory(
                            mealList: meals,
                          )
                        : const Center(
                            child: Text("No hay recetas en esta categoría")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({required this.nameCategory});
  final String nameCategory;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      expandedHeight: 110,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          width: 200,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: const Color(0xffFF785B),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              nameCategory,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
