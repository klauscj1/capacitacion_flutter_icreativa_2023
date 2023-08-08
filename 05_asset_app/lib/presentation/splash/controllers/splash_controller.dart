import 'package:asset_app/presentation/screens/videos/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  late Widget route;
  SplashController() {
    _initController();
  }

  Future<void> _initController() async {
    await Future.delayed(const Duration(seconds: 2));
    route = const VideosScreen();
    notify();
  }
}
