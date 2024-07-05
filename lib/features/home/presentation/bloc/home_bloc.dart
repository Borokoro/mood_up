import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mood_up/core/error/failures.dart';
import 'package:mood_up/core/constants/constants.dart' as c;
import '../../data/models/home_data_model.dart';
import '../../domain/usecases/fetch_comics_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchComicsUseCase fetchComicsUseCase;
  late List<HomeDataModel> comicsList;

  HomeBloc({required this.fetchComicsUseCase}) : super(const HomeState()) {
    on<FetchComicsEvent>(_onFetchComicsEvent);
  }

  _onFetchComicsEvent(FetchComicsEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());
    final Either<Failure, List<HomeDataModel>> result = await fetchComicsUseCase
        .call();
    result.fold(
            (l) => emit(HomeError(message: l.toString())),
            (r) {
          emit(HomeState(data: r));
        }
    );
  }
}
