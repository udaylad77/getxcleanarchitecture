// lib/features/photo_list/data/repositories/photo_repository_impl.dart
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/photo.dart';
import '../../domain/repositories/photo_repository.dart';
import '../datasources/photo_remote_datasource.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;

  PhotoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Photo>>> getPhotos() async {
    try {
      final remotePhotos = await remoteDataSource.getPhotos();
      return Right(remotePhotos);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
