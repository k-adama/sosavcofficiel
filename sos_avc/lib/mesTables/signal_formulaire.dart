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
 

  //text editing controller for text field
  final _formKey = GlobalKey<FormState>();
  //la liste des villes
  final List<String> villes = <String>[' ','Abidjan','Bouaké','Yamoussoukro','Daloa','San Pedro'];

  String? dropdownValue = '';
  final dateinput = TextEditingController(); 
  final action = TextEditingController();
  final medicament = TextEditingController(); 

  //Fin variables

//Vider champs après clique
  void Clean() {
    action.clear();
    medicament.clear();
    dateinput.clear(); 
    _images.clear();
    setState(() {
      dropdownValue = '';
    });
  }
  //fin

  //debut fonction
  Future saveCrise() async {
    //print(code);
    print(dateinput.text);
    print(medicament.text);
    print(action.text);
    print(dropdownValue);
    // ignore: unused_local_variable
    // if(action.text == "") {
     
    //   // final response = await http.post(Uri.parse('https://avcespoir.simplonien-da.net/mobile/save_crise.php'),
    //   //   body: {
    //   //     "date": dateinput.text,
    //   //     "mediacament":medicament.text,
    //   //     "action":action.text,
    //   //     "lieu":dropdownValue,
    //   //   });
      
    //   // if(response.statusCode == 200){
    //   //   // ignore: use_build_context_synchronously
    //   //   var data = json.decode(response.body);
    //   //   if(data['code'] == 200){
    //   //      print(data['msg']);
    //   //       Fluttertoast.showToast(
    //   //       msg: data['msg'],
    //   //       toastLength: Toast.LENGTH_SHORT,
    //   //       gravity: ToastGravity.SNACKBAR,
    //   //       fontSize: 16.0);
          
    //   //     Clean();
    //   //   }else {
    //   //     Fluttertoast.showToast(
    //   //       msg: data['msg'],
    //   //       toastLength: Toast.LENGTH_SHORT,
    //   //       gravity: ToastGravity.SNACKBAR,
    //   //       fontSize: 16.0);
    //   //   }
       
    //   } else {
    //     print(response);
    //     Clean();
    //     Fluttertoast.showToast(
    //         msg: "erreur d'enrégistrement",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.SNACKBAR,
    //         fontSize: 16.0);
    //   }
    // }
      
        Fluttertoast.showToast(
            msg: "Enrégistrement effectué",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            fontSize: 16.0);
            Clean();
      
  }
  // Future datepick(BuildContext cont) async {
    
  // }

  XFile? image;

  List _images = [];

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    
        var uri = "https://avcespoir.simplonien-da.net/mobile/insert_img.php";
    
        var request = http.MultipartRequest('POST', Uri.parse(uri));
    
        if(img != null){
    
          var pic = await http.MultipartFile.fromPath("image", img.path);
    
          request.files.add(pic);
    
          await request.send().then((result) {
    
            http.Response.fromStream(result).then((response) {
    
              var message = jsonDecode(response.body);
    
              // show snackbar if input data successfully
              final snackBar = SnackBar(content: Text(message['message']));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
              //get new list images 
              getImageServer();
            });
    
          }).catchError((e) {
    
            print(e);
    
          });
        }
  }

  Future getImageServer() async {
      try{
  
        final response = await http.get(Uri.parse('https://avcespoir.simplonien-da.net/mobile/get_img.php'));
  
        if(response.statusCode == 200){
          final data = jsonDecode(response.body);
  
          setState(() {
            _images = data;
            print(_images);
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
    getImageServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                            print(_images);
                                                      
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
                
                  Row(
                    
                    children: [
                      for(var i=0; i<_images.length; i++)
                      Image(
                        image: NetworkImage('https://avcespoir.simplonien-da.net/mobile/images/'+_images[i]),
                        //fit: BoxFit.cover,
                        height:100,
                        width:100,
                      ),
                    ],
                  ),
             
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
                            if (_formKey.currentState!.validate()) {
                              //saveCrise();     
                              Clean();                       
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('enrégistrement effectué')),
                              );
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


