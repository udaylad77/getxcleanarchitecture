// lib/features/photo_list/presentation/controllers/photo_controller.dart
import 'package:get/get.dart';
import 'package:getmockapi/core/usecase/usecase.dart';
import '../../domain/entities/photo.dart';
import '../../domain/usecases/get_photos.dart';
import '../../../../core/error/failures.dart';

class PhotoController extends GetxController {
  final GetPhotos getPhotosUseCase;
  var photos = <Photo>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  PhotoController({required this.getPhotosUseCase});

  @override
  void onInit() {
    super.onInit();
    loadPhotos();
  }

  Future<void> loadPhotos() async {
    isLoading(true);
    final failureOrPhotos = await getPhotosUseCase(NoParams());
    failureOrPhotos.fold(
      (failure) => errorMessage(_mapFailureToMessage(failure)),
      (photoList) => photos.assignAll(photoList),
    );
    isLoading(false);
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
