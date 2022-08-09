import 'package:flutter/material.dart';
import 'package:loja_virtual_selim/commom/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual_selim/models/page_maneger.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final pageController = PageController(initialPage: 0);
  // final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => PageManeger(pageController),
        child: PageView(
          controller: pageController,
// impede que movimente a pageController/page view com gestos
          physics: const NeverScrollableScrollPhysics(),

          children: <Widget>[
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: const Text('Home'),
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: const Text('Produtos'),
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: const Text('Meus Pedidos'),
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: const Text('Lojas'),
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: const Text('Usuarios'),
              ),
            ),
            Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: const Text('Pedidos'),
              ),
            ),

            /*Container(
              color: Colors.red,
/*  BOTAO DE EXEMPLO, NO MEIO
         child: ElevatedButton(
            onPressed: () {
              pageController.jumpToPage(2);
            },
            child: Text('Proximo'),
          ),*/
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),*/
          ],
        ));
  }
}
