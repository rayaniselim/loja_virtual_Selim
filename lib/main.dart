import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_selim/models/user_manager.dart';
import 'package:loja_virtual_selim/screens/base/base_screen.dart';
import 'package:loja_virtual_selim/screens/base/login/login_screen.dart';
import 'package:loja_virtual_selim/screens/base/login/signup/signup_screen.dart';
import 'package:provider/provider.dart';

main() {
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsuarioManager(),
// feito instantaneamente (NOME)
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loja Virtual Ray',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 216, 170, 6),
          primarySwatch: Colors.amber,
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          // scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(elevation: 0),
          // appBarTheme: AppBarTheme(color: Colors.black),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: BaseScreen(),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
          // home: MyHomePage(title: 'Loja Selim'),
        },
      ),
    );
  }
}
