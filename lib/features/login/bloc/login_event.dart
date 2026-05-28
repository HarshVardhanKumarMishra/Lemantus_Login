// lib/features/login/bloc/login_event.dart

import 'package:equatable/equatable.dart';

/// THE BLUEPRINT
/// Equatable is a tool that helps Flutter compare objects to prevent useless UI re-renders 
/// (exactly like React's dependency arrays in useEffect).
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// THE ACTION
/// This is triggered when the user clicks the login button. It carries the payload.
class LoginRequested extends LoginEvent {
  final String username;
  final String password;

  const LoginRequested({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}