// lib/features/photo_list/domain/usecases/get_photos.dart
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/photo.dart';
import '../repositories/photo_repository.dart';

class GetPhotos extends UseCase<List<Photo>, NoParams> {
  final PhotoRepository repository;

  GetPhotos(this.repository);

  @override
  Future<Either<Failure, List<Photo>>> call(NoParams params) async {
    return await repository.getPhotos();
  }
}
