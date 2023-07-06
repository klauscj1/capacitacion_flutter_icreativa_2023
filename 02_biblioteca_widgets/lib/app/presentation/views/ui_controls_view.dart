import 'package:flutter/material.dart';

class UiControlsView extends StatefulWidget {
  const UiControlsView({super.key});

  @override
  State<UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { carro, avion, bote, submarino }

class _UiControlsViewState extends State<UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.carro;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text("Developer mode"),
          subtitle: const Text("Controles adicionales modo dev"),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = value;
            });
          },
        ),
        ExpansionTile(
          title: const Text("Tipo de transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
              title: const Text("Carro"),
              subtitle: const Text("Viaja en carro"),
              value: Transportation.carro,
              groupValue: selectedTransportation,
              onChanged: (_) {
                setState(() {
                  selectedTransportation = Transportation.carro;
                });
              },
            ),
            RadioListTile(
              title: const Text("Avion"),
              subtitle: const Text("Viaja en avion"),
              value: Transportation.avion,
              groupValue: selectedTransportation,
              onChanged: (_) {
                setState(() {
                  selectedTransportation = Transportation.avion;
                });
              },
            ),
            RadioListTile(
              title: const Text("Bote"),
              subtitle: const Text("Viaja en bote"),
              value: Transportation.bote,
              groupValue: selectedTransportation,
              onChanged: (_) {
                setState(() {
                  selectedTransportation = Transportation.bote;
                });
              },
            ),
            RadioListTile(
              title: const Text("Submarino"),
              subtitle: const Text("Viaja en submarino"),
              value: Transportation.submarino,
              groupValue: selectedTransportation,
              onChanged: (_) {
                setState(() {
                  selectedTransportation = Transportation.submarino;
                });
              },
            ),
            //TODO: Tarea es utilizar el widget CheckboxListTile con 3 ejemplos
          ],
        ),
      ],
    );
  }
}
