// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, unnecessary_new, unused_local_variable, duplicate_ignore, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sos_avc/accueil.dart';
import 'package:sos_avc/mesTables/contact.dart';
import 'package:sos_avc/option.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_avc/bienvenu.dart';
import 'accueil.dart';
import 'option.dart';

void login() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var code = preferences.getString('code');
  runApp(MaterialApp(
    home: code == null
        ? MyHomePageLogin(
            title: '',
          )
        : MyHomePageAccueil(
            title: '',
          ),
  ));
}

class MyHomePageLogin extends StatefulWidget {
  const MyHomePageLogin({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageLogin> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageLogin> {
  //variables
  TextEditingController code = new TextEditingController();
  
  //Fin variables

//Vider champs après clique
  void Clean() {
    code.clear();
  }
  //fin

  //debut fonction
  Future login(BuildContext cont) async {
    // ignore: unused_local_variable
    if (code.text == "") {
      Fluttertoast.showToast(
          msg: "Veuillez remplir le champ !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          fontSize: 16.0);
    } else {
      var codeMalade = code.text;
      //http://s-p4.com/kindo/traitement/verifCodeUsers.php
      final response = await http.post(
          Uri.parse("https://avcespoir.simplonien-da.net/mobile/login_malade.php"),
          body: {
            "code": code.text,
          });
      var data = json.decode(response.body);
      if (data == "accepte") {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("code", code.text);
        // ignore: use_build_context_synchronously
        final prefs =  await SharedPreferences.getInstance(); //sharedpreference instence
        //save code MALADE
        prefs.setString('idMalade',codeMalade);
        Navigator.push(
          cont,
          MaterialPageRoute(builder: (context) => MyAccueil()),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Identifiant incorrecte",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 16.0);
      }
    }
  }
  //fin fonction


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,

        //Bouton retour
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyOption()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Image.asset(
                'images/log_avc.png',
                height: 100,
                width: 280,
              ),
              SizedBox(
                height: 50,
              ),
              AlertDialog(
                title: const Text('Entrez votre identifiant'),
                content: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: SizedBox(
                            width: 270,
                            child: TextFormField(
                              controller: code,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Numéro / Identifiant',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            child: SizedBox(
                          width: 190,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.limeAccent[700],
                              shape: StadiumBorder(),
                            ),
                            child: Text(
                              'SE CONNECTER',
                            ),
                            onPressed: () {
                              login(context);
                              Clean();
                            },
                          ),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          // ignore: sort_child_properties_last
                          children: <Widget>[
                            const Text(
                              'Pas identifiant?',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            TextButton(
                              child: const Text(
                                'Contactez-nous !',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text(
                                      "Comment créer mon compte ?",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.red[400],
                                      ),
                                    ),
                                    content: Text(
                                      "Veuillez vous rendre dans le centre le plus proche pour vous faire enregistrer ou Contactez-nous pour avoir plus d'informations !",
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
