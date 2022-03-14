import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
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
    // recup l'argument passé dans le context précédent
    dataMap = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // l'icon permet de fermer le context en cours et tout les précédents (empilé via des push)
                // et nous ouvre le context correspondant à l'écran de login
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              }),
        ],
      ),
      body: Center(child: afficheData()),
    );
  }
}
