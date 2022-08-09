import 'package:flutter/material.dart';
import 'package:loja_virtual_selim/commom/custom_drawer/custom_drawer_header.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomDrawerHeader(),
          DrawerTile(
            iconData: Icons.close_sharp,
            title: '',
            page: 0,
          ),
          DrawerTile(iconData: Icons.home, title: 'Inicio', page: 0),
          DrawerTile(iconData: Icons.list, title: 'Produtos', page: 1),
          DrawerTile(
              iconData: Icons.playlist_add_check,
              title: 'Meus Pedidos',
              page: 2),
          DrawerTile(
              iconData: Icons.store_mall_directory, title: 'Lojas', page: 3),
          DrawerTile(iconData: Icons.person, title: 'Usuários', page: 4),
          DrawerTile(iconData: Icons.shopping_bag, title: 'Pedidos', page: 5),
        ],
      ),
    );
  }
}
