// lib/features/photo_list/domain/entities/photo.dart
import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({required this.id, required this.title, required this.thumbnailUrl});

  @override
  List<Object?> get props => [id, title, thumbnailUrl];
}
