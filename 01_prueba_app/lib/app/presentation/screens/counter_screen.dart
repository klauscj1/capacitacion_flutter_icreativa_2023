import 'package:flutter/material.dart';
import 'package:prueba_appa/app/presentation/views/counter_view.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void addCounter() {
    setState(() {
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCounter,
        child: const Icon(Icons.add),
      ),
      body: CounterView(counterValue: counter),
    );
  }
}
