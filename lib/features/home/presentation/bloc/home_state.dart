part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<HomeDataModel> data;

  const HomeState({this.data = const []});

  @override
  List<Object> get props => [
        data,
      ];
}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object> get props => [];
}

class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
