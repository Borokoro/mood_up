import 'package:dartz/dartz.dart';
import 'package:mood_up/core/error/failures.dart';
import 'package:mood_up/features/home/data/models/home_data_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeDataModel>>> getHomeData();
}
