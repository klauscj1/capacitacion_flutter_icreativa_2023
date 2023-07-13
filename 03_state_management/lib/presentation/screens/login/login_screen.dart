import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

//TODO: Crearse un estado (controllador) que tenga las variables para almacenar el dato de correo electronico y contraseña
//TODO: Crearse un proveeedor para el estado
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar sesión"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  //TODO: CAMBIAR EL VALOR DE CORREO EN EL ESTADO
                  print(value);
                },
                decoration:
                    const InputDecoration(hintText: "Correo electrónico"),
              ),
              TextField(
                onChanged: (value) {
                  //TODO: CAMBIAR EL VALOR DE CONTRASENA EN EL ESTADO
                  print(value);
                },
                decoration: const InputDecoration(hintText: "Contreña"),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: FilledButton(
                  onPressed: () {
                    //TODO: Crear un metodo en el estado que me permita revisar el valor de las variables de correo y contraseña
                  },
                  child: const Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
