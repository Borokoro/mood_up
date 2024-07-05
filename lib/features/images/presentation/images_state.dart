part of 'images_cubit.dart';

abstract class ImagesState{
  const ImagesState();
}

class ImagesInitialState extends ImagesState{
  ImagesInitialState();
}

class ImagesLoadingState extends ImagesState{
  ImagesLoadingState();
}

class ImagesLoadedState extends ImagesState{
  ImagesLoadedState();
}