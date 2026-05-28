// test/features/login/bloc/login_bloc_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lemantus_login/features/login/bloc/login_bloc.dart';
import 'package:lemantus_login/features/login/bloc/login_event.dart';
import 'package:lemantus_login/features/login/bloc/login_state.dart';
import 'package:lemantus_login/features/login/repository/auth_repository.dart';

// 1. THE FAKE REPOSITORY
// We write a "Fake" exactly as the instructions requested. 
// It doesn't use the internet; it just simulates the repository behavior instantly.
class FakeAuthRepository implements AuthRepository {
  final bool shouldSucceed;

  FakeAuthRepository({this.shouldSucceed = true});

  @override
  Future<String> login(String username, String password) async {
    if (shouldSucceed) {
      return 'fake_token_123';
    } else {
      throw Exception('Invalid username or password');
    }
  }
}

void main() {
  // 2. THE TEST SUITE
  group('LoginBloc Tests', () {
    late LoginBloc loginBloc;
    late FakeAuthRepository fakeRepository;

    // setUp runs before every single test to ensure a clean slate
    setUp(() {
      fakeRepository = FakeAuthRepository(shouldSucceed: true);
      loginBloc = LoginBloc(authRepository: fakeRepository);
    });

    // tearDown runs after every test to clean up memory
    tearDown(() {
      loginBloc.close();
    });

    // TEST 1: Initial State
    test('initial state should be LoginInitial', () {
      expect(loginBloc.state, equals(LoginInitial()));
    });

    // TEST 2: Success Flow
    // blocTest handles the complex stream of states perfectly.
    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginSuccess] when login is successful',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginRequested(username: 'admin', password: 'password123')),
      expect: () => [
        LoginLoading(),
        const LoginSuccess('fake_token_123'),
      ],
    );

    // TEST 3: Failure Flow
    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginFailure] when login fails',
      // We override the setup here to force the fake repository to fail
      build: () => LoginBloc(authRepository: FakeAuthRepository(shouldSucceed: false)),
      act: (bloc) => bloc.add(const LoginRequested(username: 'harsh', password: 'wrong')),
      expect: () => [
        LoginLoading(),
        const LoginFailure('Exception: Invalid username or password'),
      ],
    );
  });
}