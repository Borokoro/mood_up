import 'package:dartz/dartz.dart';
import 'package:mood_up/core/error/failures.dart';
import 'package:mood_up/features/home/data/models/home_data_model.dart';
import 'package:mood_up/features/home/domain/repositories/home_repository.dart';

class FetchComicsUseCase {
  final HomeRepository homeRepository;

  const FetchComicsUseCase({required this.homeRepository});

  Future<Either<Failure, List<HomeDataModel>>> call() {
    return homeRepository.getHomeData();
  }
}
