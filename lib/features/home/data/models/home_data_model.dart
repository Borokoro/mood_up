import 'package:mood_up/features/home/domain/entities/home_entity.dart';

class HomeDataModel extends HomeEntity{
  const HomeDataModel({
    required super.description,
    required super.imageUrl,
    required super.title,
    required super.writers,
    required super.imageExtension,
});

  factory HomeDataModel.fromApi(Map<String, dynamic> json, List<String> creators){
    return HomeDataModel(
        description: json['description'],
        imageUrl: json['images'][0]['path'],
        title: json['title'],
        writers: creators,
        imageExtension: json['images'][0]['extension'],
    );
  }

  Map<String, dynamic> toJson() => {
    "description": description,
    "imageUrl": imageUrl,
    "title": title,
    "writers": writers,
    "imageExtension": imageExtension,
  };

  factory HomeDataModel.fromEntity(HomeEntity entity){
    return HomeDataModel(
        description: entity.description,
        imageUrl: entity.imageUrl,
        title: entity.title,
        writers: entity.writers,
        imageExtension: entity.imageExtension);
  }
}