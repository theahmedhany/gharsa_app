// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductsModel _$CategoryProductsModelFromJson(
  Map<String, dynamic> json,
) => CategoryProductsModel(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : ProductsModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryProductsModelToJson(
  CategoryProductsModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageIndex: (json['pageIndex'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      data:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageIndex': instance.pageIndex,
      'count': instance.count,
      'items': instance.data,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
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

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
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
