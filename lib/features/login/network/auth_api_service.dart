// lib/features/login/network/auth_api_service.dart

abstract class AuthApiService {
  Future<Map<String, dynamic>> loginPostRequest({
    required String username,
    required String password,
  });
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Map<String, dynamic>> loginPostRequest({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    if (username == 'admin' && password == 'password123') {
      return {
        'statusCode': 200,
        'token': 'mock_jwt_token_89754398',
        'message': 'Login successful',
      };
    } else {
      return {
        'statusCode': 401,
        'message': 'Invalid username or password',
      };
    }
  }
}