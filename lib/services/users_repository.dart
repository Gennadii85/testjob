import 'package:testjob/services/user_api.dart';

import '../first_option/data_json/json_convert_photos.dart';
import '../first_option/data_json/json_convert_users.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.fetchUsers();
  Future<List<Photos>> getAllPhotos() => _userProvider.fetchPhotos();
}
