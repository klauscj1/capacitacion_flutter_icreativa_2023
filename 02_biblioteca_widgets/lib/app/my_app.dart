import 'package:biblioteca_widgets/app/config/app_theme.dart';
import 'package:biblioteca_widgets/app/presentation/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const MenuScreen(),
    );
  }
}
