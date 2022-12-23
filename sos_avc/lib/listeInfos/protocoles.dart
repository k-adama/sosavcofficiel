// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/infos.dart';

void main() {
  runApp(const Protocole());
}

class Protocole extends StatelessWidget {
  const Protocole({super.key});

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
  String text =
      '''le Protocole de prise en charge des AVC ischémiques : après un scanner cérébral et/ ou une IRM cérébrale éliminant une hémorragie intra parenchymateuse ou méningée
Aspegic 250 mg IV le premier jour , puis relais  le lendemain  Kardegic 160 mg ( 1 scht à midi ) 
Nacl 0,9 % 1L sur 24h en continue 
Lovenox 4000 UI/0,4 ml une seringue en ss/c par jour 
Protocole insuline ( adaptée en fonction de la glycémie )
Traitement de la TA que si >220/120 mmHg dans les 72h minimales qui suivent l’AVC , par le nicardipine 1mg/ml (50 ml vitesse 0,5 mh/h )''';
String text1='''
Position inclinée au 30° au premier jour ,puis assise au 2ème jour ,  puis fauteuil et lever autoriser au 3ème jour à l’absence de sténose intra ou extra crânienne aux examens radiologiques des troncs supra aortiques ;
Surveillances TA, FC, Glycémie , Saturation en oxygène, globe vesical , NIHSS ( clinique ) 
''';
  String text2 = '''	Bilan etiologique 
Echodoppler des troncs supra aortiques 
Echographie trans-thoracique ou trans-oesophagienne ( patient jeune < 55 ans ) 
Holter ECG de 72 h 
Bilan biologique : ASAT, ALAT,GGT,PAL, BILIRUBINE, CHOLESTEROL HDL, TRIGLYCERIDES, LDL, NFS, IONOGRAMME COMPLET, UREE, CREATININE, CLAIRANCE, FIBRINOGENE, TP, TCA, CRP, HBA1C A JEUN, TSH/FT4, TROPONINE, VIT B12, B9, B6
Et débuter dès le lever du malade : kinésithérapie , ergothérapie , orthophoniste et orienter dans un centre de rééducation fonctionnel ou un soins de suivi et de réadaptation après la réalisation du bilan étiologique 
''';
  String text3 = '''	Traitement de sortie en focntion de la cause 
Selon la classification TOAST, on distingue 5 causes 
-	Atheromateuse ( stenose intra cranienne ou extra cranienne > 50% ) 2AAP pendant 21 jours ou 3 mois puis passage au simple AAP, Atorvastatine forte 80 mg dose avec obj LDL < 0,55 g/L
-	Cardio embolique ( FA , Flutter , thrombus intra VG ) : Eliquis , Xarelto , Pradaxa 
-	Microangiopathique :  simple AAP , atorvastatine forte dose obj LDL <0,70 g/L
-	Cause rares ( dissection arterielle , FOP-ASIA , troubles de la coagulation = simple AAP, si cancer = INNOHEP ) 
-	Cause indeterminée : simple AAP 
''';
  String text4 = '''Protocole de traitement AVC HEMMORAGIQUE 
Nacl 0,9 % 1L sur 24h en continue 
Lovenox 4000 UI/0,4 ml une seringue en ss/c par jour à partir de J2
Protocole insuline 
Traiter la TA par le nicardipine 1mg/ml (50 ml vitesse 0,5 mh/h )obj < 135/85 mmHg
Position inclinée au 30° au premier jour ,puis assise au 2ème jour ,  puis fauteuil et lever autoriser au 3ème jour à l’absence de sténose intra ou extra crânienne aux examens radiologiques des troncs supra aortiques ;
Surveillances TA, FC, Glycémie , Saturation en oxygène, globe vesical , ETAT DE CONSCIENCE , NIHSS ( clinique ) 
''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: new Text(
               text +text1 + text2 +text3 +text4,
                textAlign: TextAlign.justify,
                style: new TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyInfos(),
            ),
          );
        },
      ),
    );
  }
}
