import 'package:asset_app/config/theme/app_theme.dart';
import 'package:asset_app/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AssetsApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const SplashScreen(),
    );
  }
}
