// lib/features/login/data_source/auth_remote_data_source.dart

import '../network/auth_api_service.dart';

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
  @override
  String toString() => message;
}

abstract class AuthRemoteDataSource {
  Future<String> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<String> login(String username, String password) async {
    final response = await apiService.loginPostRequest(
      username: username,
      password: password,
    );

    if (response['statusCode'] == 200) {
      return response['token']; 
    } else {
      throw ServerException(response['message']); 
    }
  }
}