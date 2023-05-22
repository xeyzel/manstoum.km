import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/presentation/screen/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setIndex(int index) => emit(state.copyWith(index: index));
}
