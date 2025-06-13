// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewOrderResponse _$NewOrderResponseFromJson(Map<String, dynamic> json) =>
    NewOrderResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: OrderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewOrderResponseToJson(NewOrderResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) =>
    OrderData(orderId: (json['orderId'] as num).toInt());

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
  'orderId': instance.orderId,
};
