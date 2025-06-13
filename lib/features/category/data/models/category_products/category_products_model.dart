import 'package:json_annotation/json_annotation.dart';

part 'category_products_model.g.dart';

@JsonSerializable()
class CategoryProductsModel {
  int? statusCode;
  String? message;
  ProductsModel? data;

  CategoryProductsModel({this.statusCode, this.message, this.data});

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryProductsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryProductsModelToJson(this);
}

@JsonSerializable()
class ProductsModel {
  int? pageSize;
  int? pageIndex;
  int? count;

  @JsonKey(name: 'items')
  List<ProductData>? data;

  ProductsModel({this.pageSize, this.pageIndex, this.count, this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return _$ProductsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}

@JsonSerializable()
class ProductData {
  @JsonKey(name: 'id')
  int? productId;

  String? name;

  @JsonKey(name: 'imageCover')
  String? pictureUrl;

  String? size;

  @JsonKey(name: 'quantity')
  int? stockQuantity;

  double? price;
  int? categoryId;
  String? categoryName;
  int? rate;
  double? discount;
  String? description;
  bool? isActive;
  String? orderedDate;
  String? harvestDate;
  String? traderName;

  ProductData({
    this.productId,
    this.name,
    this.pictureUrl,
    this.size,
    this.stockQuantity,
    this.price,
    this.categoryId,
    this.categoryName,
    this.rate,
    this.discount,
    this.description,
    this.isActive,
    this.orderedDate,
    this.harvestDate,
    this.traderName,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return _$ProductDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
