import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../database/sqlite_bd.dart';
import 'dart:convert';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sos avc',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyListHospital(title: 'SOS AVC'),
    );
  }
}

class MyListHospital extends StatefulWidget {
  const MyListHospital({super.key, required this.title});

  final String title;

  @override
  State<MyListHospital> createState() => _MyListHospitalState();
}

class _MyListHospitalState extends State<MyListHospital> {

 //variables
  List<Map<String, dynamic>> _searchedville = []; // list des résultatt de la recherche
  var not_found_msg = "aucun hopital trouvé"; // message
  
  //recupeartion de la valeur de l'input
  TextEditingController lieu = TextEditingController();

  // method de requete des données dans la BDD
  void _getHopitaux(ville) async {
    final data = await SQLHelper.getHopitaux(ville);
    setState(() {
      _searchedville = data;
    });
  }

  // method d'affichage de la map
  launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  
  void search() {
    if(lieu.text != ""){
      final enterville = lieu.text.trim();
      _getHopitaux(enterville);

      if(_searchedville.isNotEmpty){
        not_found_msg = "";
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ),
        Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(            
              padding: EdgeInsets.all(5.0),
              child: TextFormField(            
              controller: lieu,             
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,             
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Entree votre ville',
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: ElevatedButton(
                child: Text('rechercher'),
                onPressed: () => {
                  search()                 
                },
                )
              ),
          
          SizedBox(
            height: 20,
          ),
          if(_searchedville.isNotEmpty) 
          for(var n in _searchedville)
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
            title: Text(
              "${n['hopitaux_Cat_gorie']} ${n['hopitaux_Ville_et_commune']}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("${n['hopitaux_geopoint']}"),
            onTap: () {
                var url = "https://www.google.com/maps/@${n['hopitaux_geopoint']},20z?hl=fr";
                launchURL(url);                
            }
          ),
          
          Text('$not_found_msg'),

        ])
      ],
    );
  }
}
