part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {
  final List<SearchDataModel> data;
  const SearchInitialState({this.data = const []});

  @override
  List<Object> get props => [
        data,
      ];
}

class SearchLoading extends SearchState {
  const SearchLoading();

  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  final String message;
  const SearchError({required this.message});

  @override
  List<Object> get props => [message];
}

class SearchLoaded extends SearchState {
  final List<SearchDataModel> data;
  const SearchLoaded({required this.data});

  @override
  List<Object> get props => [
        data,
      ];
}
