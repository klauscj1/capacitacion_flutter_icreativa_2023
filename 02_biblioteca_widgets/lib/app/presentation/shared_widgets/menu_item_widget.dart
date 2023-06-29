import 'package:biblioteca_widgets/app/domain/models/menu_item_model.dart';
import 'package:flutter/material.dart';

//Custom widgets
class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.menuItem,
  });

  final MenuItemModel menuItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.leadingIcon),
      trailing: const Icon(Icons.chevron_right_outlined),
      onTap: () {
        //Navegacion 1.0
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => menuItem.screen,
          ),
        );
      },
    );
  }
}
