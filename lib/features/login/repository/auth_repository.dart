// lib/features/login/repository/auth_repository.dart

abstract class AuthRepository {
  Future<String> login(String username, String password);
}