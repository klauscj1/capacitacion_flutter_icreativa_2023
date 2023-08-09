import 'package:camara_app/presentation/screens/camara/camara_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camara app"),
      ),
      body: Center(
        child: TextButton.icon(
          onPressed: () {
            availableCameras().then((value) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CamaraScreen(cameras: value),
                ),
              );
            });
          },
          icon: const Icon(Icons.camera_alt_rounded),
          label: const Text("Abrir camara"),
        ),
      ),
    );
  }
}
