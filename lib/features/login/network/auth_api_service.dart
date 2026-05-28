// lib/features/login/network/auth_api_service.dart

/// 1. THE INTERFACE (Like a TypeScript Interface)
/// This defines the blueprint. Any class that implements this MUST have a login function.
abstract class AuthApiService {
  Future<Map<String, dynamic>> loginPostRequest({
    required String username,
    required String password,
  });
}

/// 2. THE IMPLEMENTATION
/// This is the actual code that does the work.
class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Map<String, dynamic>> loginPostRequest({
    required String username,
    required String password,
  }) async {
    // Simulating a 2-second network request to a server
    await Future.delayed(const Duration(seconds: 2));

    // Hardcoded logic for the assignment
    if (username == 'admin' && password == 'password123') {
      // Simulating a successful 200 OK JSON response
      return {
        'statusCode': 200,
        'token': 'mock_jwt_token_89754398',
        'message': 'Login successful',
      };
    } else {
      // Simulating a 401 Unauthorized JSON response
      return {
        'statusCode': 401,
        'message': 'Invalid username or password',
      };
    }
  }
}