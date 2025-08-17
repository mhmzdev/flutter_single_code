import 'package:flutter/material.dart';
import 'package:flutter_single_code/router/router.dart';
import 'package:flutter_single_code/router/routes.dart';

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
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.grey[900],
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
          displayMedium: TextStyle(
            color: Colors.grey[900],
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            color: Colors.grey[900],
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          headlineLarge: TextStyle(
            color: Colors.grey[900],
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            color: Colors.grey[900],
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: TextStyle(color: Colors.grey[900], fontSize: 18),
          titleLarge: TextStyle(
            color: Colors.grey[900],
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
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
      routes: appRoutes,
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.tasks,
    );
  }
}
