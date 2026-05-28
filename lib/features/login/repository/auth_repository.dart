// lib/features/login/repository/auth_repository.dart

/// THE INTERFACE
/// The BLoC layer will only ever talk to this abstract class, never the concrete implementation.
abstract class AuthRepository {
  Future<String> login(String username, String password);
}