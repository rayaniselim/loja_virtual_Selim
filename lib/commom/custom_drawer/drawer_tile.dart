import 'package:flutter/material.dart';
import 'package:loja_virtual_selim/models/page_maneger.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({required this.iconData, required this.title, required this.page});
  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
// declaracao de variaveis
    final int curPage = context.watch<PageManeger>().page;
// retorno de inkwel q significa uma area clicavel
    final Color primarycOLOR = Theme.of(context).primaryColor;
    return InkWell(
// EFEITO DE TOQUE NO BOTAO
        onTap: () {
          context.read<PageManeger>().setPage(page);
// acessar o PageManeger de qql parte do APP, e coloca a page que quer ir
          // debugPrint('Toquei $page');
        },
// TEMA
        child: SizedBox(
            height: 60,
            child: Row(
// ROW - deixar o texto do lado do icone
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Icon(
                    iconData,
                    size: 32,
                    color: curPage == page ? primarycOLOR : Colors.grey[700],
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: curPage == page ? primarycOLOR : Colors.grey[700],
                  ),
                ),
              ],
            )));
  }
}
