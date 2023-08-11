import 'package:flutter/material.dart';
import 'package:gps_app/presentation/details/details_screen.dart';
import 'package:gps_app/presentation/global_controllers/gps_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton.icon(
          onPressed: () {
            gpsProvider.read.obtenerUbicacion().then(
                  (void v) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Details(),
                    ),
                  ),
                );
          },
          icon: const Icon(Icons.location_on),
          label: const Text("Iniciar gps"),
        ),
      ),
    );
  }
}
