import 'package:flutter/material.dart';
import 'package:receta_cocina/models/category_response.dart';
import 'package:receta_cocina/widget/category_item.dart';

class CategoryComponents extends StatelessWidget {
  const CategoryComponents({super.key, required this.categories});
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10, left: 10),
            child: Text(
              "Categorías",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(child: CategoryItem(categories: categories)),
        ],
      ),
    );
  }
}
