// lib/injection/injection.dart

import 'package:get_it/get_it.dart';

// Notice the '../' added to these imports!
import '../features/login/bloc/login_bloc.dart';
import '../features/login/data_source/auth_remote_data_source.dart';
import '../features/login/network/auth_api_service.dart';
import '../features/login/repository/auth_repository.dart';
import '../features/login/repository/auth_repository_impl.dart';

final sl = GetIt.instance;

void init() {
  // 1. BLOC
  sl.registerFactory(() => LoginBloc(authRepository: sl()));

  // 2. REPOSITORY
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // 3. DATA SOURCE
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiService: sl()),
  );

  // 4. NETWORK SERVICE
  sl.registerLazySingleton<AuthApiService>(
    () => AuthApiServiceImpl(),
  );
}