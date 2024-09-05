// lib/features/photo_list/presentation/pages/photo_list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/photo_controller.dart';

class PhotoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Photos'),
        backgroundColor: Colors.blue,
      ),
      body: GetX<PhotoController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }

          return ListView.builder(
            itemCount: controller.photos.length,
            itemBuilder: (context, index) {
              var photo = controller.photos[index];
              return Card(
                child: ListTile(
                  leading: Image.network(photo.thumbnailUrl),
                  title: Text(photo.title),
                  subtitle: Text('Photo ID: ${photo.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
