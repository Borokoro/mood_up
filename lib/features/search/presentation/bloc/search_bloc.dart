import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mood_up/features/search/data/models/search_data_model.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/fetch_search_result_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final FetchSearchResultUseCase fetchSearchResultUseCase;

  SearchBloc({required this.fetchSearchResultUseCase}) : super(const SearchInitialState()) {
    on<FetchSearchResultEvent>(_onFetchSearchResultEvent);
    on<ClearSearchResultEvent>(_onClearSearchResultEvent);
  }

  _onFetchSearchResultEvent(FetchSearchResultEvent event, Emitter<SearchState> emit) async{
    emit(const SearchLoading());
    final Either<Failure, List<SearchDataModel>> result = await fetchSearchResultUseCase
        .call(event.searchPhrase);
    result.fold(
            (l) => emit(SearchError(message: l.toString())),
            (r) {
          emit(SearchLoaded(data: r));
        }
    );
  }

  _onClearSearchResultEvent(ClearSearchResultEvent event, Emitter<SearchState> emit){
    emit(const SearchInitialState());
  }
}
