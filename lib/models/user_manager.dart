import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual_selim/helpers/firebase_errors.dart';
import 'package:flutter/foundation.dart';
import 'package:loja_virtual_selim/models/user.dart';

/* Essa classe vai gerenciar o acesso do usuário ao app*/
class UsuarioManager extends ChangeNotifier {
  usuarioManager() {
    _loadCurrentUsuario();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
// '_'uma variavel privada

  late Usuario usuario;

  bool _loading = false;
  bool get loading => _loading;

  bool get isLoggedIn => usuario != null;

/*
  Essa função cria o acesso ao app através do email e senha.
  Os dados de email e senha estão encapsulados dentro do objeto user.dart.
  Assim, os dados não são passados como parâmetro, diminuindo a segunrança.
*/

  Future<void> signIn(
      {required Usuario usuario,
      required Function onFail,
      required Function onSuccess}) async {
/*Quando o SignIn for iniciado. O estado é carregando */
    _loading = true;

    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: usuario.email, password: usuario.password);

      await _loadCurrentUsuario(User: result.user);

// DESABILITA O TECLADO NA TELA APÓS O LOGIN, PARA DEPOIS HABILITAR DE NOVO
// PODE TIRAR OU NAO
      await Future.delayed(const Duration(seconds: 4));

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    _loading = false;
  }

// CADASTRAR NO FIREBASE
  Future<void> signUp(
      {required Usuario usuario,
      required Function onFail,
      required Function onSuccess}) async {
    _loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: usuario.email, password: usuario.password);

//usuario.id = result.user.uid;
      usuario.id = result.user!.uid;
      this.usuario = usuario;
//Antes da confirmação de sucesso, haverá um tempo de espera para que os dados sejam gravados no Banco de Dados
      await usuario.saveData();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    _loading = false;
  }

  void signOut() {
    auth.signOut();
    usuario = Null as Usuario;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUsuario({User? User}) async {
    //final Object? currentUser = User ?? auth.currentUser;
    final currentUser = User ?? auth.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot docUser = await firestore
          .collection('users')
          .doc(currentUser.uid)
          .get(); //busca os dados do usuário logado no momento
      usuario = Usuario.doc(docUser);

      debugPrint('idUsuario: ${usuario.name}');
      notifyListeners();
    }
    print(currentUser);
  }
}
