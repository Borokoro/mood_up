import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(const DetailState(0));

  void changeDetailIndex(int index) {
    emit(DetailState(index));
  }
}
