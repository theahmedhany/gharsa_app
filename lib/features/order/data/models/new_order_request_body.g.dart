// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrderRequestBody _$NewOrderRequestBodyFromJson(Map<String, dynamic> json) =>
    NewOrderRequestBody(
      address: json['address'] as String,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      clientName: json['clientName'] as String,
      clientPhone: json['clientPhone'] as String,
    );

Map<String, dynamic> _$NewOrderRequestBodyToJson(
  NewOrderRequestBody instance,
) => <String, dynamic>{
  'address': instance.address,
  'items': instance.items,
  'clientName': instance.clientName,
  'clientPhone': instance.clientPhone,
};

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
  productId: (json['productId'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'productId': instance.productId,
  'quantity': instance.quantity,
};
