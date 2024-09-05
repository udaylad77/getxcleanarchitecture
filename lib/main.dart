import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmockapi/features/photo_list/data/datasources/photo_remote_datasource.dart';
import 'package:getmockapi/features/photo_list/data/repositories/photo_repository_impl.dart';
import 'package:getmockapi/features/photo_list/domain/usecases/get_photos.dart';
import 'package:getmockapi/features/photo_list/presentation/controllers/photo_controller.dart';
import 'package:getmockapi/features/photo_list/presentation/pages/photo_list_page.dart';
import 'package:http/http.dart' as http;

void main() {
  final photoRemoteDataSource =
      PhotoRemoteDataSourceImpl(client: http.Client());
  final photoRepository =
      PhotoRepositoryImpl(remoteDataSource: photoRemoteDataSource);
  final getPhotosUseCase = GetPhotos(photoRepository);
  final photoController = PhotoController(getPhotosUseCase: getPhotosUseCase);

  runApp(MyApp(photoController: photoController));
}

class MyApp extends StatelessWidget {
  final PhotoController photoController;
  const MyApp({super.key, required this.photoController});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: PhotoListPage(),
      initialBinding: BindingsBuilder(() {
        Get.put(photoController);
      }),
    );
  }
}
