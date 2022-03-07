import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_api_connect/profil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AffichePage extends StatefulWidget {
  const AffichePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AffichePage> createState() => _AffichePageState();
}

class _AffichePageState extends State<AffichePage> {
  Profil profil = Profil.vierge();

  Widget afficheData() {
    Column contenu = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.empty(growable: true),
    );
    contenu.children.add(Text("email: " + profil.getEmail().toString()));
    contenu.children.add(Text("Token: " + profil.getToken().toString()));

    return contenu;
  }

  @override
  Widget build(BuildContext context) {
    // recup l'argument profil
    profil = ModalRoute.of(context)?.settings.arguments as Profil;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: afficheData()),
    );
  }
}
