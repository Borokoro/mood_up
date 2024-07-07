import 'package:dartz/dartz.dart';
import 'package:mood_up/core/error/failures.dart';
import 'package:mood_up/features/search/data/models/search_data_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchDataModel>>> getSearchData(
      String searchPhrase);
}
