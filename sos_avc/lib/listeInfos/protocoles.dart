import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/infos.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/liste.dart';



class ProtocolesPage extends StatefulWidget {
  const ProtocolesPage({super.key});



  @override
  State<ProtocolesPage> createState() => _ProtocolesPageState();
}

class _ProtocolesPageState extends State<ProtocolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                    Text(
                      titretext,
                      style: TextStyle(
                        fontFamily: 'semibold',
                        fontWeight: FontWeight.w900,
                        fontSize: 25, // Remplacez la valeur ici par la taille de texte souhaitée
                        color: Colors.blue,
                      ),
                    ),
                        Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'semibold',
                            fontSize: 18, // Remplacez la valeur ici par la taille de texte souhaitée
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          text1,
                          style: TextStyle(
                            fontFamily: 'semibold',
                            fontSize: 18, // Remplacez la valeur ici par la taille de texte souhaitée
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      Text(
                        titretext2,
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontWeight: FontWeight.w900,
                          fontSize: 25, // Remplacez la valeur ici par la taille de texte souhaitée
                          color: Colors.blue,
                        ),
                      ),
                        Text(
                          text2,
                          style: TextStyle(
                            fontFamily: 'semibold',
                            fontSize: 18, // Remplacez la valeur ici par la taille de texte souhaitée
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      Text(
                        titretext3,
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontWeight: FontWeight.w900,
                          fontSize: 25, // Remplacez la valeur ici par la taille de texte souhaitée
                          color: Colors.blue,
                        ),
                      ),
                        Text(
                          text3,
                          style: TextStyle(
                            fontFamily: 'semibold',
                            fontSize: 18, // Remplacez la valeur ici par la taille de texte souhaitée
                          ),
                          textAlign: TextAlign.justify,
                        ),
                ],
              ),
            ),
              ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyInfos(),
            ),
          );
        },
      ),
    );
  }
}
