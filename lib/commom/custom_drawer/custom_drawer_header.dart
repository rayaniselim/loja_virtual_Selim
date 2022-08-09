import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:loja_virtual_selim/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<UsuarioManager>(
        builder: (_, usuarioManager, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
// ESPACAR O TEXTO NAS COLUNAS
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Selim Joias',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                //'Olá, ${usuarioManager.usuario.name ?? ''}',
                'Olá, ${usuarioManager.usuario.name}',
// SE CASO O NOME DA PESSOA FOR MUITO GRANDE, PRA NAO SAIR DA TELA
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (usuarioManager.isLoggedIn) {
                    usuarioManager.signOut();
                  } else {
                    Navigator.of(context).pushNamed('/login');
                  }
                },
                child: Text(
                  usuarioManager.isLoggedIn ? 'Sair' : 'Entre ou Cadastre-se',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
