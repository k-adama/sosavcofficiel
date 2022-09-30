// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, unnecessary_new, unused_local_variable, duplicate_ignore, non_constant_identifier_names, unnecessary_const

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sos_avc/accueil.dart';
import 'package:sos_avc/option.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MySignalForm());
}

class MySignalForm extends StatelessWidget {
  const MySignalForm({super.key});

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
  // TextEditingController code = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //Fin variables

//Vider champs après clique
  // void Clean() {
  //   code.clear();
  // }
  //fin

  //debut fonction
  // Future login(BuildContext cont) async {
  //   // ignore: unused_local_variable
  //   if (code.text == "") {
  //     Fluttertoast.showToast(
  //         msg: "Veuillez remplir le champ !",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.SNACKBAR,
  //         fontSize: 16.0);
  //   } else {
  //     final response = await http.post(
  //         Uri.parse("http://s-p4.com/kindo/traitement/verifCodeUsers.php"),
  //         body: {
  //           "code": code.text,
  //         });
  //     var data = json.decode(response.body);
  //     if (data == "accepte") {
  //       // ignore: use_build_context_synchronously
  //       Navigator.push(
  //         cont,
  //         MaterialPageRoute(builder: (context) => MyAccueil()),
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Identifiant incorrecte",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.SNACKBAR,
  //           fontSize: 16.0);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your full name',
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Enter a phone number',
                  labelText: 'Phone',
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
