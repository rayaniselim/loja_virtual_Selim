import 'package:flutter/material.dart';
import 'package:loja_virtual_selim/models/user.dart';
import 'package:provider/provider.dart';
import '../../../helpers/validators.dart';
import '../../../models/user_manager.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          ' ',
          style: TextStyle(
            color: Color.fromARGB(255, 216, 170, 6),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
// SETA PRA VOLTAR PRA PAGINA ANTERIOR
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            textColor: Color.fromARGB(255, 216, 170, 6),
            child: const Text(
              'CRIAR CONTA',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
// COLOCAR FOTO NO INICIO
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              //color: Colors.black,
              image: DecorationImage(
// PREENCHE O ESPACO DO CONTAINER
                // fit: BoxFit.fill,
                image: AssetImage('assets/images/selim_joias.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Consumer<UsuarioManager>(
                builder: (_, userManager, __) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        enabled: !userManager.loading,
                        decoration: const InputDecoration(hintText: 'E-mail'),
// vai colocar o @ no teclado
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email) {
// DEVERIA SER
// if(!emailValid(email)) return 'E-mail inválido';
                          if (!emailValid(email!)) return 'E-mail inválido';
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: passController,
                        enabled: !userManager.loading,
                        decoration: const InputDecoration(hintText: 'Senha'),
                        autocorrect: false,
                        obscureText: true,
                        validator: (pass) {
// DEVERIA ser
                          //if(pass.isEmpty || pass.length < 6)
                          if (pass!.isEmpty || pass.length < 6) {
                            return 'Senha inválida';
                          }
                          return null;
                        },
                      ),
// DISTANCIAMENTO DAS LINHAS/CAMPOS
                      const SizedBox(
                        height: 16,
                      ),
// BOTAO ESQUECI MINHA SENHA
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: const Text('Esqueci minha senha'),
                        ),
                      ),
// DISTANCIAMENTO MAIOR ENTRE O TEXTO E O CAMPO
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed:
                              // child: ElevatedButton(
                              userManager.loading
                                  ? null
                                  : () {
// DEVERIA SER
// if(formKey.currentState.validate()){}
                                      if (formKey.currentState!.validate()) {
                                        context.read<UsuarioManager>().signIn(
                                              // user: User(
                                              usuario: Usuario(
                                                email: emailController.text,
                                                password: passController.text,
                                                name: '',
                                                confirmPassword: '',
                                                id: '',
                                              ),
                                              onFail: (e) {
                                                scaffoldKey.currentState!
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'Falha ao entrar: $e'),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              },
                                              onSuccess: () {
                                                Navigator.of(context).pop();
                                              },
                                            );
                                      }
                                    },
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          textColor: Colors.white,
                          child: userManager.loading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : const Text(
                                  'Entrar',
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*         Container(
// inserir container quando estiver na duvida onde encontrar este widget
                color: Colors.amber,
                child: const SizedBox(
                  height: 16,
                  child: Text('ENTRAR'),
                  // child: Icon(Icons.login_rounded),), ),
  */
