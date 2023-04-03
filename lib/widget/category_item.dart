import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/models/category_response.dart';
import 'package:receta_cocina/services/Provider/service_data.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categories,
  }) : super(key: key);

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
          Expanded(child: _buildCategoryList(context)),
        ],
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, "category",
              arguments: category.name),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xffFE8C00),
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 20,
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(category.image),
                ),
                const SizedBox(width: 5),
                FittedBox(
                  child: Text(
                    category.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
