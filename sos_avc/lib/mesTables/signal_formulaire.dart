// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, unnecessary_new, unused_local_variable, duplicate_ignore, non_constant_identifier_names, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sos_avc/accueil.dart';
import 'package:sos_avc/option.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
//use to formatted the date_picker
import 'package:intl/intl.dart';
//camera package
import 'package:image_picker/image_picker.dart';
//unique ID package
import 'package:uuid/uuid.dart';
//shared_preferences
import 'package:shared_preferences/shared_preferences.dart';
//focus detector
import 'package:focus_detector/focus_detector.dart';

Future<void> main() async {
  

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
  var idMalade;
  var idCrise; 

  //text editing controller for text field
  final _formKey = GlobalKey<FormState>();
  //la liste des villes
  List<String> villes = <String>[' ','Abidjan','Bouaké','Yamoussoukro','Daloa','San Pedro'];

  String? dropdownValue = '';
  final dateinput = TextEditingController(); 
  final action = TextEditingController();
  final medicament = TextEditingController(); 

  //Fin variables

//Get id_malade
Future<void>  requiredId() async {
    final prefs =  await SharedPreferences.getInstance(); //sharedpreference instence
    var uuid = Uuid();
  //get ID MALADE
  setState(() {
    idMalade = prefs.getString('idMalade');
  });
  //get ID CRISE
  setState(() {
    idCrise = uuid.v1(); 
  });
  print(idMalade);
  print(idCrise);
}

  //debut fonction
  Future saveCrise(BuildContext cont) async {
    // ignore: unused_local_variable
    if (dateinput.text == "") {
      Fluttertoast.showToast(
          msg: "Veuillez renseigner la date !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          fontSize: 16.0);
    } else {
      final response = await http.post(
          Uri.parse("http://s-p4.com/kindo/traitement/insertCrise.php"),
          body: {
              "dateCrise": dateinput.text,
              "medicament": medicament.text,
              "action": action.text,
              "lieuCrise": dropdownValue,
          });
      var data = json.decode(response.body);
      if (data == "accepte") {
        Fluttertoast.showToast(
            msg: "enrégistrement effectué",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "erreur d'enregistrement, réesayer!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 16.0);
      }
    }
  }
  //fin fonction




//Vider champs après clique
  void Clean() {
    action.clear();
    medicament.clear();
    dateinput.clear();
    Images.clear(); 
    setState(() {
      dropdownValue = ' ';
    });
  }

List files = [];
  //debut fonction
  Future<bool> uploadImages(List imgs) async {
    
    
    print(imgs);
  
    print(imgs.length);
    if(imgs.length != 0){
      
      var uri = "https://avcespoir.simplonien-da.net/mobile/insert_img.php";
      
      var request = http.MultipartRequest('POST', Uri.parse(uri));
      var nbr =0;
      for (int i = 0; i < imgs.length; i++) {
        
        nbr++;
        var pic = await http.MultipartFile.fromPath("image",imgs[i]);
        request.files.add(pic);
        request.fields['id_malade'] = idMalade;
        request.fields['id_crise'] = idCrise;

        await request.send().then((result) {
  
          http.Response.fromStream(result).then((response) {
  
            var message = jsonDecode(response.body);
  
            // show snackbar if input data successfully
              Fluttertoast.showToast(
                msg: message['message']+"$nbr",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                fontSize: 16.0
              );
              Clean();
              return true;
          });
  
        }).catchError((e) {
          print(e);
  
        });
        
      }

    }
    return false;
      
  }

  List<String> Images = [];

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
      setState(() {
        Images.add(img!.path); 
      });
  }

  Future getVilles() async {
      try{
  
        final response = await http.get(Uri.parse('https://avcespoir.simplonien-da.net/mobile/get_ville.php?idMalade='+idMalade+'&idCrise='+idCrise));
  
        if(response.statusCode == 200){
          final data = jsonDecode(response.body);
  
          setState(() {
            villes = data;
            print(villes);
          });
        }
  
      }catch(e){
  
        print(e);
        
      }
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Veuillez choisir le média pour sélectionner'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('galerie'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('caméra'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }



  //Fin function
  @override
  void initState() {
    dateinput.text=""; //set the initial value of text field
    requiredId();
    getVilles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children:[ Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                      controller: dateinput, //editing controller of this TextField
                      decoration: InputDecoration( 
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Date" //label text of field
                      ),
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101),
                        );
                        
                        if(pickedDate != null ){
                          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); 
                          print(formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text = formattedDate; //set output date to TextField value. 
                          });

                        }else{
                            print("Date is not selected");
                        }
                      },
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child : DropdownButtonFormField(
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez renseigner le champs';
                          }
                          return null;
                      },
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.location_on),
                        hintText: 'Lieu de l\'incident',
                        labelText: 'Lieu',
                      ),
                      items: villes.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                        controller: action,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.pending_actions_outlined),
                          hintText: 'Dernière action avant la crise',
                          labelText: 'action avant la crise',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'veuillez renseigner le champs';
                          }
                          return null;
                        },
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child : TextFormField(
                      controller: medicament,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.medical_services_outlined),
                        hintText: 'Entrer les nom des médicaments',
                        labelText: 'Médicaments pris',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'veuillez renseigner le champs';
                        }
                        return null;
                      },
                    ),
                  ),
                
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 5),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        
                        TextButton.icon(                           
                          onPressed:  () {
                            myAlert();                                                                                  
                          },
                          label: Text(
                            'prendre la photo des médicaments ou ordonnances',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 80, 80, 80),
                            ),
                          ),
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            size: 30,
                          ), 
                          
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //if image not null show the image
                      ]
                    ),
                  ),

                
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Row(
                    children: Images.map((img){
                        return Column(
                          children: [
                            Image.file(
                            //to show image, you type like this.
                            File(img),
                            fit: BoxFit.contain,
                            width: 100,//MediaQuery.of(context).size.width,
                            height: 100,
                            ),
                            IconButton(
                            // ignore: prefer_const_constructors
                            icon: Icon(Icons.close_sharp,
                              color: Color.fromARGB(255, 176, 6, 6), size: 25.0),
                            onPressed: () {
                              print('deleted');
                              setState(() {
                                Images.remove(img);
                              });
                              
                            }),
                          ],
                        );
                    }).toList(),
                  ),),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.limeAccent[700],
                          shape: StadiumBorder(),
                          padding: EdgeInsets.all(15.0), 
                          textStyle: TextStyle(
                            fontSize: 16.6,
                          ),
                        ),
                        child: Text(
                          'Enrégistrer',
                        ),
                        onPressed: () {
                          uploadImages(Images);    
                            if (_formKey.currentState!.validate()) {
                              
                              //Clean();                       
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('enrégistrement effectué')),
                              // );
                            }
                          
                          //Clean();
                        },
                      ),
                    
                  ),
                
                  
                ],
              ),
          ),
        ),],
      ),
    
    );
  }
}
