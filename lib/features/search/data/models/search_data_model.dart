import 'package:mood_up/features/home/domain/entities/home_entity.dart';

class SearchDataModel extends HomeEntity{
  const SearchDataModel({
    required super.description,
    required super.imageUrl,
    required super.title,
    required super.writers,
    required super.imageExtension,
  });

  factory SearchDataModel.fromApi(Map<String, dynamic> json, List<String> creators, String imageUrl, String imageExtension){
    return SearchDataModel(
      description: json['description'],
      imageUrl: imageUrl,
      title: json['title'],
      writers: creators,
      imageExtension: imageExtension,
    );
  }

  Map<String, dynamic> toJson() => {
    "description": description,
    "imageUrl": imageUrl,
    "title": title,
    "writers": writers,
    "imageExtension": imageExtension,
  };

  factory SearchDataModel.fromEntity(HomeEntity entity){
    return SearchDataModel(
        description: entity.description,
        imageUrl: entity.imageUrl,
        title: entity.title,
        writers: entity.writers,
        imageExtension: entity.imageExtension);
  }
}