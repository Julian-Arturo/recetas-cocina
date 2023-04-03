import 'package:flutter/material.dart';
import 'package:receta_cocina/models/meal_response.dart';
import 'package:receta_cocina/utils/size_desing.dart';

class FilterCategory extends StatelessWidget {
  const FilterCategory({
    Key? key,
    required this.mealList,
    required this.size,
  }) : super(key: key);

  final List<Meal> mealList;
  final Responsive size;
  @override
  Widget build(BuildContext context) {
    return mealList.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mealList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2, crossAxisCount: 2, childAspectRatio: 0.9),
            itemBuilder: (context, index) {
              final meal = mealList[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  "ingredients",
                  arguments: meal.id,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 5),
                            blurRadius: 5),
                      ]),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Hero(
                          tag: meal.id,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: FadeInImage(
                              width: size.diagonal * 0.1,
                              image: NetworkImage(meal.image),
                              placeholder: const AssetImage(
                                  "assets/img/load-loading.gif"),
                              // backgroundImage:
                            ),
                          ),
                        ),
                      ),
                      Text(
                        meal.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        meal.instructions,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 10),
                      )
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
