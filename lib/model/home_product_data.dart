import 'dart:convert';

ProductDataModel getAllBankModelFromJson(String str) =>
    ProductDataModel.fromjson(json.decode(str));

class ProductDataModel {
  int? id;
  String? name;
  var price;
  String? category;

  bool? inStock;
  int? quanitity;
  String? imageUrl;
  String? description;

  ProductDataModel(
    this.id,
    this.name,
    this.price,
    this.category,
    this.inStock,
    this.quanitity,
    this.imageUrl,
    this.description,
  );
  factory ProductDataModel.fromjson(Map<String, dynamic> json) =>
      ProductDataModel(
          json['id'],
          json['name'],
          json['price'],
          json['category'],
          json['inStock'],
          json['quantity'],
          json['imageUrl'],
          json['description']);
}
