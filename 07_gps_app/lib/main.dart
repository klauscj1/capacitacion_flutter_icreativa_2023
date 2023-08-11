import 'package:flutter/material.dart';
import 'package:gps_app/config/theme/app_theme.dart';
import 'package:gps_app/presentation/screens/home_screen.dart';
import 'package:flutter_meedu/ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomeScreen(),
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        router
            .observer, // <-- this allows to flutter_meedu listen the changes in your navigator
      ],
    );
  }
}
