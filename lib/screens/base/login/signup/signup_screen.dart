import 'package:flutter/material.dart';
import 'package:loja_virtual_selim/helpers/validators.dart';
import 'package:loja_virtual_selim/models/user.dart';
import 'package:loja_virtual_selim/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Usuario usuario =
      Usuario(email: '', password: '', name: '', confirmPassword: '', id: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Criar Conta',
            style: TextStyle(
              color: Color.fromARGB(255, 216, 170, 6),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: <Widget>[
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Nome Completo'),
                    validator: (name) {
                      if (name!.isEmpty)
                        return 'Campo Obrigatório';
                      else if (name.trim().split('').length <= 1)
                        return 'Nome Incompleto';
                      return null;
                    },
                    onSaved: (name) => usuario.name = name!,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty)
                        return 'Campo Obrigatório';
                      else if (!emailValid(email)) return 'E-mail Inválido';
                      return null;
                    },
                    onSaved: (email) => usuario.email = email!,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Senha'),
                    obscureText: true,
                    validator: (pass) {
                      if (pass!.isEmpty)
                        return 'Campo Obrigatório';
                      else if (pass.length < 6)
                        return 'A senha deve ter no mínimo 6 caracteres';
                      return null;
                    },
                    onSaved: (pass) => usuario.password = pass!,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Repita a Senha'),
                    obscureText: true,
                    validator: (pass) {
                      if (pass!.isEmpty)
                        return 'Campo Obrigatório';
                      else if (pass.length < 6)
                        return 'A senha deve ter no mínimo 6 caracteres';
                      return null;
                    },
                    onSaved: (pass) => usuario.confirmPassword = pass!,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      // color: Theme.of(context).primaryColor,
                      // disabledColor:
                      //     Theme.of(context).primaryColor.withAlpha(100),
                      // textColor: Colors.white,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          if (usuario.password != usuario.confirmPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Senhas não coincidem!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          context.read<UsuarioManager>().signUp(
                              usuario: usuario,
                              onSuccess: () {
                                Navigator.of(context).pop();
                              },
                              onFail: (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Falha ao Cadastrar: $e'),
                                  backgroundColor: Colors.red,
                                ));
                              });
                        }
                      },
                      child: const Text(
                        'Criar Conta',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
