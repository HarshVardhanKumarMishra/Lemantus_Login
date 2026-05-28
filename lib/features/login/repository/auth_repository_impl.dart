// lib/features/login/repository/auth_repository_impl.dart

import '../data_source/auth_remote_data_source.dart';
import 'auth_repository.dart';

/// THE IMPLEMENTATION
class AuthRepositoryImpl implements AuthRepository {
  // Dependency Injection: The Repository needs the Data Source to do its job.
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> login(String username, String password) async {
    // In a full production app, this is where you would also check for an active 
    // internet connection, or save the resulting token to local storage (like SharedPreferences)
    // before returning it to the UI.
    
    // For this assignment, we simply pass the request down to the Data Source
    // and let the Data Source's errors bubble up to the BLoC.
    return await remoteDataSource.login(username, password);
  }
}