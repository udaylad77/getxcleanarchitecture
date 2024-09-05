// lib/features/photo_list/data/models/photo_model.dart
import '../../domain/entities/photo.dart';

class PhotoModel extends Photo {
  PhotoModel(
      {required int id, required String title, required String thumbnailUrl})
      : super(id: id, title: title, thumbnailUrl: thumbnailUrl);

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
