import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data_json/json_convert_photos.dart';
import '../data_json/json_convert_users.dart';

class UserProvider {
  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }

  Future<List<Photos>> fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => Photos.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
