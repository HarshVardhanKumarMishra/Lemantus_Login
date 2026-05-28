// lib/features/login/bloc/login_state.dart

import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

// 1. Before they click anything (Empty form)
class LoginInitial extends LoginState {}

// 2. While waiting for the API (Show a spinner)
class LoginLoading extends LoginState {}

// 3. When the API returns a 200 OK (Navigate to next screen)
class LoginSuccess extends LoginState {
  final String token;
  const LoginSuccess(this.token);

  @override
  List<Object> get props => [token];
}

// 4. When the API returns an error (Show a red text box)
class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}