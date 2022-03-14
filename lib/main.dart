import 'package:flutter/material.dart';

import 'accueilpage.dart';
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage(title: 'Flutter Demo Connect'),
        debugShowCheckedModeBanner: false,
        // définition des routes de l'application
        routes: <String, WidgetBuilder>{
          '/accueil': (BuildContext context) => const AccueilPage(title: 'Accueil'),
          '/login': (BuildContext context) => const MyHomePage(title: 'Login'),
        });
  }
}
