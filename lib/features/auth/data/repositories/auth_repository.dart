import 'package:dio/dio.dart';
import 'package:citybuddy/data/models/user_model.dart';
import 'package:citybuddy/data/network/api_service.dart';

class AuthRepository {
  final ApiService apiService = ApiService();

  Future<UserModel> login(String email, String password) async {
    final response = await apiService.post('login', {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Login failed');
    }
  }
}