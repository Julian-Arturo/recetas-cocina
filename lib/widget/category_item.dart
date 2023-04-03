import 'package:flutter/material.dart';
import 'package:receta_cocina/models/category_response.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return categories.isNotEmpty
        ? ListView.builder(
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
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInImage(
                        width: 40,
                        image: NetworkImage(category.image),
                        placeholder:
                            const AssetImage("assets/img/load-loading.gif"),
                        // backgroundImage:
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
          )
        : const Center(
            child: Image(image: AssetImage("assets/img/load-loading.gif")));
  }
}
