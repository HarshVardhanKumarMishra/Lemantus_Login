// lib/features/login/presentation/welcome_screen.dart

import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final String token;

  const WelcomeScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)], // Sleek Dark Theme
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success Icon Animation Placeholder
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent.withOpacity(0.1),
                border: Border.all(color: Colors.greenAccent, width: 2),
              ),
              child: const Icon(Icons.check_circle_outline, color: Colors.greenAccent, size: 80),
            ),
            const SizedBox(height: 40),
            
            // Welcome Text
            const Text(
              'Welcome to Lemantus.',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            
            // Subtitle with Token Proof
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Authentication successful. Your secure session has been established.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
              ),
            ),
            const SizedBox(height: 24),
            
            // Token Display (Proves Architecture works!)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Active Token: $token',
                style: const TextStyle(color: Colors.greenAccent, fontFamily: 'monospace'),
              ),
            ),
            
            const SizedBox(height: 60),

            // Logout Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF0F2027),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              icon: const Icon(Icons.logout),
              label: const Text('Secure Logout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              onPressed: () {
                // Navigate back to Login Screen and clear history
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}