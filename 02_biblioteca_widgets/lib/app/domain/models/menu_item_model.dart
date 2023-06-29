import 'package:biblioteca_widgets/app/presentation/screens/botones_screen.dart';
import 'package:biblioteca_widgets/app/presentation/screens/cards_screen.dart';
import 'package:biblioteca_widgets/app/presentation/screens/dialogs_screen.dart';
import 'package:flutter/material.dart';

class MenuItemModel {
  MenuItemModel({
    required this.title,
    required this.subTitle,
    required this.leadingIcon,
    required this.screen,
  });

  final String title;
  final String subTitle;
  final IconData leadingIcon;
  final Widget screen;
}

final menuItems = [
  MenuItemModel(
    title: "Botones",
    subTitle: "Ejemplos de botones",
    leadingIcon: Icons.account_balance_sharp,
    screen: const BotonesScreen(),
  ),
  MenuItemModel(
    title: "Cards",
    subTitle: "Ejemplos de cards",
    leadingIcon: Icons.credit_card_sharp,
    screen: const CardsScreen(),
  ),
  MenuItemModel(
    title: "Dialgos",
    subTitle: "Ejemplos de dialogs",
    leadingIcon: Icons.info,
    screen: const DialogsScreen(),
  ),
];
