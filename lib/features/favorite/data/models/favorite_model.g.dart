// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : FavoriteProductsModel.fromJson(
                json['data'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

FavoriteProductsModel _$FavoriteProductsModelFromJson(
  Map<String, dynamic> json,
) => FavoriteProductsModel(
  pageSize: (json['pageSize'] as num?)?.toInt(),
  pageIndex: (json['pageIndex'] as num?)?.toInt(),
  count: (json['count'] as num?)?.toInt(),
  data:
      (json['items'] as List<dynamic>?)
          ?.map((e) => FavoriteProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FavoriteProductsModelToJson(
  FavoriteProductsModel instance,
) => <String, dynamic>{
  'pageSize': instance.pageSize,
  'pageIndex': instance.pageIndex,
  'count': instance.count,
  'items': instance.data,
};

FavoriteProductData _$FavoriteProductDataFromJson(Map<String, dynamic> json) =>
    FavoriteProductData(
      productId: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      pictureUrl: json['imageCover'] as String?,
      size: json['size'] as String?,
      stockQuantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      orderedDate: json['orderedDate'] as String?,
      harvestDate: json['harvestDate'] as String?,
      traderName: json['traderName'] as String?,
    );

Map<String, dynamic> _$FavoriteProductDataToJson(
  FavoriteProductData instance,
) => <String, dynamic>{
  'id': instance.productId,
  'name': instance.name,
  'imageCover': instance.pictureUrl,
  'size': instance.size,
  'quantity': instance.stockQuantity,
  'price': instance.price,
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'rate': instance.rate,
  'discount': instance.discount,
  'description': instance.description,
  'isActive': instance.isActive,
  'orderedDate': instance.orderedDate,
  'harvestDate': instance.harvestDate,
  'traderName': instance.traderName,
};
