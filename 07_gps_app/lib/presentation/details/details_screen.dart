import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:gps_app/presentation/global_controllers/gps_controller.dart';
import 'package:gps_app/presentation/mapa/mapa_screen.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle gps"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final locationData = ref
                .watch(gpsProvider.select((p0) => p0.locationData))
                .locationData;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Coor en x: ${locationData.latitude}"),
                Text("Coor en y: ${locationData.longitude}"),
                Text("Altitud: ${locationData.altitude}"),
                Text("Accuracy: ${locationData.accuracy}"),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapSample(),
                          ));
                    },
                    icon: const Icon(Icons.map_sharp)),
              ],
            );
          },
        ),
      ),
    );
  }
}
