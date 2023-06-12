import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/data/repositories/user_repotiory.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_state.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  final _repository = UserRepository();

  CreateProductCubit() : super(const CreateProductState());

  void setName(String value) => emit(state.copyWith(name: value));

  void setDescription(String value) => emit(state.copyWith(description: value));

  void setPrice(int value) => emit(state.copyWith(price: value));

  void setQuantity(int value) => emit(state.copyWith(quantity: value));

  void setImage([XFile? value]) => emit(state.copyWith(imageFile: value));

  void setWarehouseId(String value) => emit(state.copyWith(WarehouseId: value));

  void reset() => emit(CreateProductState());

  Future<bool> insertProduct() async {
    if (state.WarehouseId.isEmpty) {
      return false;
    }
    if (state.imageFile == null) {
      return false;
    }
    if (state.name.isEmpty) {
      return false;
    }
    if (state.description.isEmpty) {
      return false;
    }
    if (state.quantity == 0) {
      return false;
    }

    if (state.imageFile != null) {
      emit(state.copyWith(status: Status.loading));
      try {
        final result = await _repository.uploadImage(state.imageFile!);
        if (result != null) {
          final product = Product(
            warehouseId: state.WarehouseId,
            name: state.name.trim(),
            price: state.price,
            description: state.description,
            quantity: state.quantity,
            image: result,
          );

          final insertResult = await _repository.insertProduct(product);

          if (insertResult) {
            emit(state.copyWith(
                status: Status.success, message: 'Insert Success'));

            reset();
          }
        }
        return true;
      } on FirebaseException catch (error) {
        emit(state.copyWith(
          status: Status.failure,
          message: '${error.message}',
        ));
        return false;
      }
    }
    return false;
// Future<bool> insertProduct() async {
//   emit(state.copyWith(status: Status.loading));
//   try {} catch (e) {}
// }
  }

  void findAllProduct() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final products = await _repository.findAllProduct();

      final updateProducts = products.map((e) async {
        final warehouse = await _repository.findOneWarehouse(e.warehouseId);
        return e.copyWith(warehouseName: warehouse.name);
      });

      final excecutor = await Future.wait(updateProducts);

      emit(state.copyWith(status: Status.success, products: excecutor));
    } on FirebaseException catch (error) {
      emit(state.copyWith(status: Status.failure, message: '${error.message}'));
    }
  }
}
