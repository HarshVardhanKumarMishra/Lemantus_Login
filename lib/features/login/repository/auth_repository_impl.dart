// lib/features/login/repository/auth_repository_impl.dart

import '../data_source/auth_remote_data_source.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> login(String username, String password) async {
    return await remoteDataSource.login(username, password);
  }
}