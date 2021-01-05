import 'dart:convert';

import 'package:flutter_with_api/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoService {
  Future<List<PhotoModel>> getPost() async {
    var baseUrl =
        'https://my-json-server.typicode.com/chornthorn/json-demo/photos';
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body) as List;
      return res.map((data) => PhotoModel.fromJson(data)).toList();
    }
    else {
      throw Exception("Unable to get post list");
    }
  }
}
