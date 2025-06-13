import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  int? statusCode;
  String? message;
  FavoriteProductsModel? data;

  FavoriteModel({this.statusCode, this.message, this.data});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return _$FavoriteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}

@JsonSerializable()
class FavoriteProductsModel {
  int? pageSize;
  int? pageIndex;
  int? count;

  @JsonKey(name: 'items')
  List<FavoriteProductData>? data;

  FavoriteProductsModel({this.pageSize, this.pageIndex, this.count, this.data});

  factory FavoriteProductsModel.fromJson(Map<String, dynamic> json) {
    return _$FavoriteProductsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteProductsModelToJson(this);
}

@JsonSerializable()
class FavoriteProductData {
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

  FavoriteProductData({
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

  factory FavoriteProductData.fromJson(Map<String, dynamic> json) {
    return _$FavoriteProductDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FavoriteProductDataToJson(this);
}
