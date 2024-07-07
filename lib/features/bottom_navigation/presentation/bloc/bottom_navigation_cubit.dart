import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/skeleton/presentation/bloc/skeleton_cubit.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationChosenScreen> {
  BottomNavigationCubit() : super(const BottomNavigationChosenScreen(0));

  void changeScreen(int screenInitial, int chosenScreen, BuildContext context) {
    if (screenInitial != chosenScreen) {
      if (context.read<SkeletonCubit>().state.isDetailPage) {
        context.read<SkeletonCubit>().goFromDetailPage();
      }
      emit(BottomNavigationChosenScreen(chosenScreen));
    }
  }
}
