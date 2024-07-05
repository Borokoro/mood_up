import 'package:dartz/dartz.dart';
import 'package:mood_up/core/error/failures.dart';
import 'package:mood_up/features/search/data/models/search_data_model.dart';
import 'package:mood_up/features/search/domain/repositories/search_repository.dart';

class FetchSearchResultUseCase{
  final SearchRepository searchRepository;

  FetchSearchResultUseCase({required this.searchRepository});

  Future<Either<Failure, List<SearchDataModel>>> call(String searchPhrase){
    return searchRepository.getSearchData(searchPhrase);
  }

}