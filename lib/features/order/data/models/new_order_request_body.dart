import 'package:json_annotation/json_annotation.dart';

part 'new_order_request_body.g.dart';

@JsonSerializable()
class NewOrderRequestBody {
  final String address;
  final List<OrderItem> items;
  final String clientName;
  final String clientPhone;

  NewOrderRequestBody({
    required this.address,
    required this.items,
    required this.clientName,
    required this.clientPhone,
  });

  factory NewOrderRequestBody.fromJson(Map<String, dynamic> json) =>
      _$NewOrderRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NewOrderRequestBodyToJson(this);
}

@JsonSerializable()
class OrderItem {
  final int productId;
  final int quantity;

  OrderItem({required this.productId, required this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
