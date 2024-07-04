

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_up/features/bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:mood_up/features/home/data/datasources/home_data_source.dart';
import 'package:mood_up/features/home/data/repositories/home_repository_impl.dart';
import 'package:mood_up/features/home/domain/repositories/home_repository.dart';
import 'package:mood_up/features/home/domain/usecases/fetch_comics_usecase.dart';
import 'package:mood_up/features/home/presentation/bloc/home_bloc.dart';
import 'package:requests_inspector/requests_inspector.dart';

final locator=GetIt.instance;

void setupLocator(){

  //cubit
  locator.registerFactory(() => BottomNavigationCubit());

  //bloc
  locator.registerFactory(() => HomeBloc(fetchComicsUseCase: locator()));

  //use-cases
  locator.registerLazySingleton(() => FetchComicsUseCase(homeRepository: locator()));

  //repositories
  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeDataSource: locator()));

  //data-sources
  locator.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl(dio: locator()));

  //clients
  locator.registerLazySingleton(
          () => Dio()..interceptors.add(RequestsInspectorInterceptor()));
}