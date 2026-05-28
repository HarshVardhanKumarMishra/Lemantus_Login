// lib/features/login/bloc/login_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../repository/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // Dependency Injection: The BLoC ONLY talks to the Repository.
  final AuthRepository authRepository;

  // We start with the LoginInitial state (empty form).
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    
    // When we hear 'LoginRequested', we run the '_onLoginRequested' function.
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    // 1. Immediately tell the UI to show a loading spinner
    emit(LoginLoading());

    try {
      // 2. Ask the Repository to perform the login
      final token = await authRepository.login(event.username, event.password);
      
      // 3. If it succeeds, tell the UI to show success
      emit(LoginSuccess(token));
    } catch (e) {
      // 4. If it fails, tell the UI to show an error message
      emit(LoginFailure(e.toString()));
    }
  }
}