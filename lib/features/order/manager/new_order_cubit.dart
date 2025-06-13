import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/new_order_request_body.dart';
import '../data/repos/new_order_repo.dart';

import 'new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  final NewOrderRepo _newOrderRepo;
  NewOrderCubit(this._newOrderRepo) : super(const NewOrderState.idle());

  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientPhoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitNewOrder(int productId) async {
    emit(const NewOrderState.loading());
    try {
      final response = await _newOrderRepo.newOrder(
        NewOrderRequestBody(
          clientName: clientNameController.text,
          clientPhone: clientPhoneController.text,
          address: addressController.text,
          items: [
            OrderItem(
              productId: productId,
              quantity: int.parse(quantityController.text),
            ),
          ],
        ),
      );

      response.when(
        success: (newOrderResponse) async {
          emit(NewOrderState.success(newOrderResponse));
        },
        failure: (error) {
          emit(
            NewOrderState.error(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        const NewOrderState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }

  @override
  Future<void> close() {
    clientNameController.dispose();
    clientPhoneController.dispose();
    addressController.dispose();
    quantityController.dispose();
    return super.close();
  }
}
