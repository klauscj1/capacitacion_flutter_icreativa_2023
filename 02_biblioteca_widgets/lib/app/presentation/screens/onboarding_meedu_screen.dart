import 'package:animate_do/animate_do.dart';
import 'package:biblioteca_widgets/app/domain/models/slider_item_model.dart';
import 'package:biblioteca_widgets/app/presentation/shared_widgets/slide.dart';
import 'package:flutter/material.dart';

//TODO: Crear un controllador para manejar el estado
//TODO: Crear un provider para utilizar el controller
//TODO: Cambiar a StatelessWidget OnboardingMeeduScreen
//TODO: Utilizar el controlador para redibujar los cambios en la ui (Consumer) escuchando todo el controlador o parte de el
//TODO: van a subir este proyecto a los repositorios propios github (individuales), repositorio publico
//      enviarme la url de repositorio al grupo de whatsapp hasta el día Lunes 9pm.
class OnboardingMeeduScreen extends StatefulWidget {
  const OnboardingMeeduScreen({super.key});

  @override
  State<OnboardingMeeduScreen> createState() => _OnboardingMeeduScreenState();
}

class _OnboardingMeeduScreenState extends State<OnboardingMeeduScreen> {
  PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (page >= (sliders.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      } else {
        setState(() {
          endReached = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: sliders
                .map((slide) => SliderWidget(
                      slide: slide,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 60,
            child: TextButton(
              child: const Text("Skip"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: endReached
                ? FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                      child: const Text("Empezar"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
}
