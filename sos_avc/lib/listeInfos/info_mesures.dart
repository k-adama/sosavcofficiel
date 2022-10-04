// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';

void main() {
  runApp(const MyMesuresPreventives());
}

class MyMesuresPreventives extends StatelessWidget {
  const MyMesuresPreventives({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: 
              new Text(
                "Elle repose sur la prise en charge des facteurs de risque d'AVC.• HTA : principal facteur de risque des AVC, ischémiques ou hémorragiques :augmentation du risque relatif (RR) de 4 environ ; plus de la moitié des AVC surviennent dans un contexte d'HTA chronique.  • Tabac : RR = 2. Important facteur de risque d'athérosclérose carotidienne.• Hypercholestérolémie : RR = 1,5. Ce facteur de risque majeur de l'infarctus du myocarde est un facteur de risque plus accessoire des infarctus cérébraux. • Diabète : RR = 1,5.• Alcoolisme chronique : augmentation progressive du risque au-delà de 3 verres standard par jour (risque d'infarctus cérébral et d'hémorragie intraparenchymateuse). • Migraine : augmentation du risque chez la femme jeune, surtout en cas de migraine avec aura associée à un tabagisme et une contraception orale. Contraception orale : faible augmentation du RR, limitée encore par l'utilisation des pilules microdosées ; le risque est essentiellement lié à l'effet synergique avec le tabac. Obésité, syndrome métabolique, absence d'activité physique, syndrome d'apnées obstructives du sommeil : leur rôle est moins bien démontré que pour les cardiopathies ischémiques. Il n'y a pas d'intérêt au plan neurovasculaire à la prise d'aspirine au long cours en l'absence de manifestation d'AIT ou d'infarctus cérébral.",
               textAlign: TextAlign.justify,
               style: new TextStyle(
                color: Colors.black,
                fontSize: 25.0
               ),
              ),
              
            )
          ],
        ),
      ),
    );
  }
}
