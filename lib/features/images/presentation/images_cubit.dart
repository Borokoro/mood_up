import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
//import 'package:meta/meta.dart';
import 'package:mood_up/core/constants/constants.dart' as c;
import 'package:mood_up/features/search/data/models/search_data_model.dart';
import '../../home/data/models/home_data_model.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesInitialState());

  void cacheAllImages(
      BuildContext context, List<HomeDataModel> homeDataModel) async {
    emit(ImagesLoadingState());
    for (int i = 0; i < homeDataModel.length; i++) {
      await precacheImage(
          NetworkImage(
              '${homeDataModel[i].imageUrl}/${c.imageHS}.${homeDataModel[i].imageExtension}'),
          context);
    }
    emit(ImagesLoadedState());
  }

  void cacheAllImagesSearch(
      BuildContext context, List<SearchDataModel> searchDataModel) async {
    emit(ImagesLoadingState());
    for (int i = 0; i < searchDataModel.length; i++) {
      await precacheImage(
          NetworkImage(
              '${searchDataModel[i].imageUrl}/${c.imageHS}.${searchDataModel[i].imageExtension}'),
          context);
    }
    emit(ImagesLoadedState());
  }
}
