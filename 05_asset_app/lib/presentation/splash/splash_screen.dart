import 'package:asset_app/presentation/screens/videos/videos_screen.dart';
import 'package:asset_app/presentation/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

final splashProvider =
    SimpleProvider<SplashController>((ref) => SplashController());

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (context, controller) {
        videosProvider.read.loadNextPage();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => controller.route,
          ),
        );
      },
      builder: (context, controller) => Scaffold(
        body: Center(
          child: Text(
            "Assets App",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
