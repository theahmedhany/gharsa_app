import 'package:json_annotation/json_annotation.dart';

part 'new_order_response.g.dart';

@JsonSerializable()
class NewOrderResponse {
  final int statusCode;
  final String message;
  final OrderData data;

  NewOrderResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NewOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$NewOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderResponseToJson(this);
}

@JsonSerializable()
class OrderData {
  final int orderId;

  OrderData({required this.orderId});

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}
