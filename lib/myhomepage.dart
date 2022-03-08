import 'package:flutter/material.dart';
import 'package:flutter_api_connect/profil.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String mdp = "";

  Map<String, dynamic> dataMap = new Map();
  bool recupDataBool = false;

  // renvoie la requete préparé http en mode POST
  Future<http.Response> recupConnect(String login, String mdp) {
    return http.post(
      Uri.parse('https://s3-4400.nuage-peda.fr/forum/public/api/authentication_token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>{'email': login, 'password': mdp}),
    );
  }

  // recupère le resultat d'une requete http et stock le resultat dans dataMap
  Future<void> recupDataJson() async {
    //var reponse = await recupConnect("raymond.paris@free.fr", "raymond");
    var reponse = await recupConnect(email, mdp);
    if (reponse.statusCode == 200) {
      dataMap = convert.jsonDecode(reponse.body);
      recupDataBool = true;
    } else {
      print("erreur " + reponse.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // login
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Email", hintText: "Saisir votre email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Erreur de saisie";
                  } else {
                    email = value;
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              // password
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "Mot de passe", hintText: "Saisir votre mot de passe password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Erreur de saisie";
                  } else {
                    mdp = value;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      await recupDataJson();
                      if (recupDataBool) {
                        Navigator.pushNamed(context, '/affiche', arguments: dataMap);
                        /* ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(profil.toString())),
                        ); */
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Erreur dans la connection à la BDD"),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Erreur dans le login/mdp"),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
