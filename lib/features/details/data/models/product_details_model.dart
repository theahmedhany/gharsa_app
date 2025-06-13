import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  int? statusCode;
  String? message;
  ProductDetailsData? data;

  ProductDetailsModel({this.statusCode, this.message, this.data});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}

@JsonSerializable()
class ProductDetailsData {
  int? id;
  String? name;
  double? discount;
  String? description;
  String? categoryName;
  int? categoryId;
  double? price;
  int? quantity;
  String? imageCover;
  bool? isActive;
  String? orderedDate;
  String? harvestDate;
  String? traderName;

  ProductDetailsData({
    this.id,
    this.name,
    this.discount,
    this.description,
    this.categoryName,
    this.categoryId,
    this.price,
    this.quantity,
    this.imageCover,
    this.isActive,
    this.orderedDate,
    this.harvestDate,
    this.traderName,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsDataToJson(this);
}
