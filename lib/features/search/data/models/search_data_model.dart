import 'package:mood_up/features/home/domain/entities/home_entity.dart';
import 'package:mood_up/features/search/domain/entities/search_entity.dart';

class SearchDataModel extends SearchEntity {
  const SearchDataModel({
    required super.description,
    required super.imageUrl,
    required super.title,
    required super.writers,
    required super.imageExtension,
    required super.detailsUrl,
  });

  factory SearchDataModel.fromApi(
      Map<String, dynamic> json,
      List<String> creators,
      String imageUrl,
      String imageExtension,
      String detail) {
    return SearchDataModel(
      description: json['description'],
      imageUrl: imageUrl,
      title: json['title'],
      writers: creators,
      imageExtension: imageExtension,
      detailsUrl: detail,
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "imageUrl": imageUrl,
        "title": title,
        "writers": writers,
        "imageExtension": imageExtension,
      };

  factory SearchDataModel.fromEntity(HomeEntity entity) {
    return SearchDataModel(
        description: entity.description,
        imageUrl: entity.imageUrl,
        title: entity.title,
        writers: entity.writers,
        imageExtension: entity.imageExtension,
        detailsUrl: entity.detailsUrl);
  }
}
