import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/pages/home_page/components/category_componets.dart';
import 'package:receta_cocina/pages/home_page/components/header_title.dart';
import 'package:receta_cocina/services/Provider/service_data.dart';
import 'package:receta_cocina/utils/size_desing.dart';
import 'package:receta_cocina/widget/filter_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ServiceData>(context);

    Responsive size = Responsive(context);
    return Column(
      children: [
        HeaderTitle(size: size),
        CategoryComponents(
          categories: item.btnCategory,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: FilterCategory(
                size: size,
                mealList: item.meals.take(10).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
