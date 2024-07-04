import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable{
  final String imageUrl;
  final String title;
  final String description;
  final List<String> writers;
  final String imageExtension;

  const HomeEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.writers,
    required this.imageExtension,
});

  @override
  List<Object?> get props => [
    title,
    description,
    imageUrl,
    writers,
    imageExtension,
  ];
}