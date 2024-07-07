import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'skeleton_state.dart';

class SkeletonCubit extends Cubit<IsDetailPageChosen> {
  SkeletonCubit() : super(const IsDetailPageChosen(false));

  void goToDetailPage() {
    emit(const IsDetailPageChosen(true));
  }

  void goFromDetailPage() {
    emit(const IsDetailPageChosen(false));
  }
}
