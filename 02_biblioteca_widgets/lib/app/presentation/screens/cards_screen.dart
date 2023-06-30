import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {"elevation": 0.0, "label": "Elevation 0.0"},
  {"elevation": 1.0, "label": "Elevation 1.0"},
  {"elevation": 2.0, "label": "Elevation 2.0"},
  {"elevation": 3.0, "label": "Elevation 3.0"},
  {"elevation": 4.0, "label": "Elevation 4.0"},
  {"elevation": 5.0, "label": "Elevation 5.0"},
  {"elevation": 6.0, "label": "Elevation 6.0"},
];

//TODO: Tarea: dibujar dinamicamente un Card por cada item del list cards
class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      // body: Column(
      //   children: [],
      // ),
      body: const Card(
        child: Padding(
          child: const Text("Card..."),
          padding: EdgeInsets.all(30),
        ),
      ),
    );
  }
}
