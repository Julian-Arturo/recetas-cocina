import 'dart:convert';

class CategoryResponse {
  CategoryResponse({
    required this.categories,
  });

  List<Category> categories;

  factory CategoryResponse.fromJson(String str) =>
      CategoryResponse.fromMap(json.decode(str));

  factory CategoryResponse.fromMap(Map<String, dynamic> json) =>
      CategoryResponse(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
      );
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  String id;
  String name;
  String image;
  String description;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["idCategory"],
        name: json["strCategory"],
        image: json["strCategoryThumb"],
        description: json["strCategoryDescription"],
      );
}
