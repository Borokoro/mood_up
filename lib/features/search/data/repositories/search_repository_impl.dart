import 'package:dartz/dartz.dart';
import 'package:mood_up/features/search/domain/repositories/search_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/search_data_source.dart';
import '../models/search_data_model.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchDataSource searchDataSource;

  SearchRepositoryImpl({required this.searchDataSource});

  @override
  Future<Either<Failure, List<SearchDataModel>>> getSearchData(
      String searchPhrase) async {
    try {
      final result = await searchDataSource.fetchSearchResult(searchPhrase);
      return Right(result);
    } on ApiException {
      return const Left(ApiFailure("Failed to fetch comics"));
    } on Exception {
      return const Left(ApiFailure("Failed to fetch comics"));
    }
  }
}
