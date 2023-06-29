import 'package:flutter/material.dart';

class BotonesScreen extends StatelessWidget {
  const BotonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botones page"),
      ),
      body: const Center(
        child: Text("Botones page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.chevron_left_rounded),
      ),
    );
  }
}
