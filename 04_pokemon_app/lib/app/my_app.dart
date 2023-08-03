import 'package:flutter/material.dart';
import 'package:pokemon_app/app/config/app_theme.dart';
import 'package:pokemon_app/app/presentation/screens/pokemons/pokemons_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme().getTheme(),
      home: const PokemonsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
