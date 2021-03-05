// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.categoryId,
    this.name,
    this.image,
    this.price,
    this.stock,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.category,
  });

  int id;
  int categoryId;
  String name;
  String image;
  String price;
  int stock;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Category category;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] as int,
        categoryId: json["category_id"] as int,
        name: json["name"] as String,
        image: json["image"] as String,
        price: json["price"] as String,
        stock: json["stock"] as int,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["delete_at"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "image": image,
        "price": price,
        "stock": stock,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] as int,
        name: json["name"] as String,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
