import 'package:dartz/dartz.dart';
import 'package:mood_up/core/error/exceptions.dart';
import 'package:mood_up/core/error/failures.dart';
import 'package:mood_up/features/home/data/datasources/home_data_source.dart';
import 'package:mood_up/features/home/data/models/home_data_model.dart';
import 'package:mood_up/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository{
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, List<HomeDataModel>>> getHomeData() async{
    try{
      final result=await homeDataSource.fetchComics();
      return Right(result);
    } on ApiException{
      return const Left(ApiFailure("Failed to fetch comics"));
    } on Exception{
      return const Left(ApiFailure("Failed to fetch comics"));
    }
  }
}