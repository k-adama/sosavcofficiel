// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, unnecessary_new, unused_local_variable, duplicate_ignore, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sos_avc/accueil.dart';
import 'package:sos_avc/mesTables/contact.dart';
import 'package:sos_avc/option.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyLogin());
}

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sos avc',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'SOS AVC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      final response = await http.post(
          Uri.parse("http://s-p4.com/kindo/traitement/verifCodeUsers.php"),
          body: {
            "code": code.text,
          });
      var data = json.decode(response.body);
      if (data == "accepte") {
        // ignore: use_build_context_synchronously
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

  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Image.asset(
                'images/log_avc.png',
                height: 250,
                width: 280,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Entrer votre identifiant',
                  style: TextStyle(fontSize: 20),
                ),
              ),
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
                height: 50,
              ),
              Row(
                // ignore: sort_child_properties_last
                children: <Widget>[
                  const Text('Pas identifiant?'),
                  TextButton(
                    child: const Text(
                      'Contactez-nous !',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
