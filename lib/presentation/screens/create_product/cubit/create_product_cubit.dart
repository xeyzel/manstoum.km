import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_app/core/constant/status.dart';
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

  // Future<bool> insertProduct() async {
  //   emit(state.copyWith(status: Status.loading));
  //   try {} catch (e) {}
  // }
}
