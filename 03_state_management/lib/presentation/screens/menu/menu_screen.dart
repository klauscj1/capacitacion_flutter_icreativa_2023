import 'package:flutter/material.dart';
import 'package:state_management/presentation/screens/change_theme/change_theme_screen.dart';
import 'package:state_management/presentation/screens/change_theme_stateful/change_theme_stateful_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State management"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Cambiar el tema"),
            subtitle: const Text("Utilizando stateful Widget"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeThemeStatefulScreen(),
                  ));
            },
          ),
          ListTile(
            title: const Text("Cambiar el tema"),
            subtitle: const Text("Utilizando flutter meedu"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeThemeScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}