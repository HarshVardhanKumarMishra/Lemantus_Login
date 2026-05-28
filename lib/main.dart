import 'package:flutter/material.dart';
import 'injection/injection.dart' as di;
import 'features/login/presentation/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const LemantusApp());
}

class LemantusApp extends StatelessWidget {
  const LemantusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lemantus Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}