part of 'search_bloc.dart';

class SearchEvent extends Equatable{
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchResultEvent extends SearchEvent{
  final String searchPhrase;
  const FetchSearchResultEvent({required this.searchPhrase});

  @override
  List<Object> get props => [
    searchPhrase,
  ];
}

class ClearSearchResultEvent extends SearchEvent{
  const ClearSearchResultEvent();

  @override
  List<Object> get props => [];
}
