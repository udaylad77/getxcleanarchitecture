// lib/features/photo_list/domain/repositories/photo_repository.dart
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/photo.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<Photo>>> getPhotos();
}
