import 'package:get_it/get_it.dart';
import 'package:mood_up/features/bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';

final locator=GetIt.instance;

void setupLocator(){
  locator.registerFactory(() => BottomNavigationCubit());
}