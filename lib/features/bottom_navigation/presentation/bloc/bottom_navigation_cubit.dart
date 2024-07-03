import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mood_up/features/home/presentation/pages/home_screen.dart';
import 'package:mood_up/features/search/presentation/pages/search_screen.dart';
import 'package:routemaster/routemaster.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationChosenScreen> {
  BottomNavigationCubit() : super(const BottomNavigationChosenScreen(0));

  void changeScreen(int screenInitial, int chosenScreen , BuildContext context){
    if(screenInitial!=chosenScreen){
      if(chosenScreen==0){
       // Routemaster.of(context).push('/home');
      }
      else{
       // Routemaster.of(context).push('/search');
      }
      emit(BottomNavigationChosenScreen(chosenScreen));
    }
  }
}
