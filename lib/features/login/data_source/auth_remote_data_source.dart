// lib/features/login/data_source/auth_remote_data_source.dart

import '../network/auth_api_service.dart';

/// 1. CUSTOM EXCEPTION
/// In production, we throw specific errors so the UI knows exactly what went wrong.
class ServerException implements Exception {
  final String message;
  ServerException(this.message);
  @override
  String toString() => message;
}

/// 2. THE INTERFACE
abstract class AuthRemoteDataSource {
  Future<String> login(String username, String password);
}

/// 3. THE IMPLEMENTATION
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // Dependency Injection: Notice how we don't create the API service inside this class. 
  // We pass it in via the constructor. This is exactly what Lemantus asked for.
  final AuthApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<String> login(String username, String password) async {
    // Call the network layer
    final response = await apiService.loginPostRequest(
      username: username,
      password: password,
    );

    // Handle the raw response
    if (response['statusCode'] == 200) {
      return response['token']; // Return the JWT token on success
    } else {
      // Throw our custom exception if the server rejects the login
      throw ServerException(response['message']); 
    }
  }
}