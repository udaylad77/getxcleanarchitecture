// lib/features/photo_list/data/datasources/photo_remote_datasource.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo_model.dart';
import '../../../../core/error/exceptions.dart';

abstract class PhotoRemoteDataSource {
  Future<List<PhotoModel>> getPhotos();
}

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  final http.Client client;

  PhotoRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PhotoModel>> getPhotos() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => PhotoModel.fromJson(data)).toList();
    } else {
      throw ServerException();
    }
  }
}
