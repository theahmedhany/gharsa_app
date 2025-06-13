// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : ProductDetailsData.fromJson(
                json['data'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
  ProductDetailsModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};

ProductDetailsData _$ProductDetailsDataFromJson(Map<String, dynamic> json) =>
    ProductDetailsData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      discount: (json['discount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      categoryName: json['categoryName'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      imageCover: json['imageCover'] as String?,
      isActive: json['isActive'] as bool?,
      orderedDate: json['orderedDate'] as String?,
      harvestDate: json['harvestDate'] as String?,
      traderName: json['traderName'] as String?,
    );

Map<String, dynamic> _$ProductDetailsDataToJson(ProductDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'discount': instance.discount,
      'description': instance.description,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'price': instance.price,
      'quantity': instance.quantity,
      'imageCover': instance.imageCover,
      'isActive': instance.isActive,
      'orderedDate': instance.orderedDate,
      'harvestDate': instance.harvestDate,
      'traderName': instance.traderName,
    };
