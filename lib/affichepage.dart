import 'package:flutter/material.dart';
import 'package:flutter_api_connect/profil.dart';

class AffichePage extends StatefulWidget {
  const AffichePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AffichePage> createState() => _AffichePageState();
}

class _AffichePageState extends State<AffichePage> {
  Map<String, dynamic> dataMap = new Map();

  Widget afficheData() {
    Column contenu = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.empty(growable: true),
    );
    contenu.children.add(Text("Token: " + dataMap['token'].toString()));

    return contenu;
  }

  @override
  Widget build(BuildContext context) {
    // recup l'argument profil
    dataMap = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: afficheData()),
    );
  }
}
