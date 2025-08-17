import 'package:flutter/material.dart';

import 'screens/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Single Code',
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Colors.grey[900], fontSize: 36),
          displayMedium: TextStyle(color: Colors.grey[900], fontSize: 32),
          displaySmall: TextStyle(color: Colors.grey[900], fontSize: 28),
          headlineLarge: TextStyle(color: Colors.grey[900], fontSize: 24),
          headlineMedium: TextStyle(color: Colors.grey[900], fontSize: 20),
          headlineSmall: TextStyle(color: Colors.grey[900], fontSize: 18),
          titleLarge: TextStyle(color: Colors.grey[900], fontSize: 16),
          titleMedium: TextStyle(color: Colors.grey[900], fontSize: 14),
          titleSmall: TextStyle(color: Colors.grey[900], fontSize: 12),

          bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
          bodySmall: TextStyle(color: Colors.black, fontSize: 12),
          labelLarge: TextStyle(color: Colors.black, fontSize: 14),
          labelMedium: TextStyle(color: Colors.black, fontSize: 12),
          labelSmall: TextStyle(color: Colors.black, fontSize: 10),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
