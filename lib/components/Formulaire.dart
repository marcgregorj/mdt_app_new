import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mdt_app/data/dataForm.dart';

// Import multiselct
import 'package:multiselect/multiselect.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({Key? key}) : super(key: key);

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {


  List<String> Q13Selected = [];

  //Textfield enable or disable
  bool _isTextFieldQ1 = false;
  bool _isTextFieldQ5 = false;
  bool _isTextFieldQ6 = false;
  bool _isTextFieldQ8 = false;
  bool _isTextFieldQ9 = false;


  // Initial Selected Value
  String quest1 = 'Etats-unis';
  String quest2 = '15-24';
  String quest3 = 'Masculin';
  String quest4 = 'Une fois';
  String quest5 = 'Hôtel/Motel';
  String quest6 = 'Vacances/Loisirs';
  String quest8 = 'Jacmel';
  String quest9 = 'La Citadelle (PNH)';
  String quest10 = 'Amis / Famille';
  String quest12_A = 'Excellent';
  String quest12_B = 'Excellent';
  String quest12_C = 'Excellent';
  String quest12_D = 'Excellent';
  String quest12_E = 'Excellent';
  String quest12_F = 'Excellent';
  String quest12_G = 'Excellent';
  String quest12_H = 'Excellent';
  String quest12_I = 'Excellent';
  String quest12_J = 'Excellent';
  String quest12_K = 'Excellent';
  String quest15 = 'Oui';
  String quest16 = 'Oui';



  //Input controler
  final InputCtrlQuest1 = TextEditingController();
  final InputCtrlQuest5 = TextEditingController();
  final InputCtrlQuest6 = TextEditingController();
  final InputCtrlQuest7 = TextEditingController();
  final InputCtrlQuest8 = TextEditingController();
  final InputCtrlQuest9 = TextEditingController();

  final InputCtrlQuest10_A = TextEditingController();
  final InputCtrlQuest10_B = TextEditingController();
  final InputCtrlQuest10_C = TextEditingController();
  final InputCtrlQuest10_D = TextEditingController();
  final InputCtrlQuest10_E = TextEditingController();
  final InputCtrlQuest10_F = TextEditingController();
  final InputCtrlQuest10_G = TextEditingController();
  final InputCtrlQuest10_H = TextEditingController();
  final InputCtrlQuest10_I = TextEditingController();
  final InputCtrlQuest10_J = TextEditingController();

  final InputCtrlQuest13_A = TextEditingController();
  final InputCtrlQuest13_B = TextEditingController();

  final InputCtrlQuest15 = TextEditingController();
  final InputCtrlQuest16 = TextEditingController();

  final InputCtrlQuest17 = TextEditingController();
  final InputCtrlQuest18 = TextEditingController();
  final InputCtrlQuest19 = TextEditingController();





  

  submitedFormRequest () {

    final firestoreInstance = FirebaseFirestore.instance;

  firestoreInstance.collection("statokap").add(
  {
    "quest1" : {"qt1" :quest1, "Autre": InputCtrlQuest1.text},
    "quest2" : quest2,
    "quest3" : quest3,
    "quest4" : quest4,
    "quest5" : {"qt5" :quest5, "Autre": InputCtrlQuest5.text},
    "quest6" : {"qt6" :quest6, "Autre": InputCtrlQuest6.text},
    "quest7" : InputCtrlQuest7.text,
    "quest8" : {"qt8" :quest8, "Autre": InputCtrlQuest8.text},
    "quest9" : {"qt9" :quest9, "Autre": InputCtrlQuest9.text},
    "quest10" : quest10,
    "quest11" : {
                  "qt11_A": InputCtrlQuest10_A.text, 
                  "qt11_B": InputCtrlQuest10_B.text, 
                  "qt11_C": InputCtrlQuest10_C.text, 
                  "qt11_D": InputCtrlQuest10_D.text, 
                  "qt11_E": InputCtrlQuest10_E.text,
                  "qt11_F": InputCtrlQuest10_F.text, 
                  "qt11_G": InputCtrlQuest10_G.text, 
                  "qt11_H": InputCtrlQuest10_H.text, 
                  "qt11_I": InputCtrlQuest10_I.text, 
                  "qt11_J": InputCtrlQuest10_J.text,
                },
    "quest12" : {
                  "qt12_A": quest12_A, 
                  "qt12_B": quest12_B, 
                  "qt12_C": quest12_C, 
                  "qt12_D": quest12_D, 
                  "qt12_E": quest12_E,
                  "qt12_F": quest12_F, 
                  "qt12_G": quest12_G, 
                  "qt12_H": quest12_H, 
                  "qt12_I": quest12_I, 
                  "qt12_J": quest12_J,
                  "qt12_K": quest12_K,
                },
    "quest13" : {
                  "qt13_A": InputCtrlQuest13_A.text,
                  "qt13_B": InputCtrlQuest13_B.text,
                },
    "quest14" : Q13Selected,
    "quest15" : {"qt15" :quest15, "Autre": InputCtrlQuest15.text},
    "quest16" : {"qt16" :quest16, "Autre": InputCtrlQuest16.text},
    "quest17" : InputCtrlQuest17.text,
    "quest18" : InputCtrlQuest18.text,
    "quest19" : InputCtrlQuest19.text,
    

  
  }).then((value){

    
    Fluttertoast.showToast(
        msg: "Enregistrement effectué",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        fontSize: 30.0
    );


    print(value.id);
  });

    /* CollectionReference collRef = FirebaseFirestore.instance.collection('statokap');

    collRef.add({
      'quest1': quest1,
      'quest2': quest2, 
      'quest3': quest3, 
      'quest4': quest4, 
      'quest5': quest5, 
    });
*/
    print("ok");
    
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[



              //Question 1
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '1- Quel est votre pays de résidence habituel/pays d’origine/pays de nationalité ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix1.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest1 = newValue!;
                                  if(newValue == "Autres"){
                                    _isTextFieldQ1 = true;
                                  }
                                  else{
                                    _isTextFieldQ1 = false;
                                    InputCtrlQuest1.text = "";
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest1,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest1,
                              enabled: _isTextFieldQ1,
                              decoration: InputDecoration(
                                  hintText: 'Autre',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),


              //Deux box horizontales
              new Row(
                children: [

                  //Box gauche
                  Expanded(
                      child: // Question 2
                      new Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '2- Quelle est votre tranche d’âge?',
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [

                                  Expanded(
                                    child: DropdownButtonFormField(
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: DataForm.choix2.map((String item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          quest2 = newValue!;

                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: quest2,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                  ),

                  //Box droite
                  Expanded(
                      child: // Question 2
                      new Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '3- Quelle est votre sexe?',
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                children: [

                                  Expanded(
                                    child: DropdownButtonFormField(
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: DataForm.choix3.map((String item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          quest3 = newValue!;

                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: quest3,
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ],
                          ),
                        ),
                      ),


                  ),
                ],
              ),

              SizedBox(height: 10.0),



              //Question 4
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '4-	Combien de fois avez-vous visité le Nord, y compris ce voyage ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix4.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest4 = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest4,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),



              //Question 5
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '5-	Quel(s) mode(s) de logement avez-vous utilisés pendant votre séjour en Haïti ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix5.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest5 = newValue!;
                                  if(newValue == "Autres"){
                                    _isTextFieldQ5 = true;
                                  }
                                  else{
                                    _isTextFieldQ5 = false;
                                    InputCtrlQuest5.text = "";
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest5,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest5,
                              enabled: _isTextFieldQ5,
                              decoration: InputDecoration(
                                  hintText: 'Autre',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 10.0),


              //Question 6
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '6-	Quel a été le but de votre voyage dans le Nord ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),


                          DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix6.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest6 = newValue!;
                                  if(newValue == "Autres"){
                                    _isTextFieldQ6 = true;
                                  }
                                  else{
                                    _isTextFieldQ6 = false;
                                    InputCtrlQuest6.text = "";
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest6,
                                border: OutlineInputBorder(),
                              ),
                            ),


                          SizedBox(height: 10.0),
                          TextFormField(
                              controller: InputCtrlQuest6,
                              enabled: _isTextFieldQ6,
                              decoration: InputDecoration(
                                  hintText: 'Autre',
                                  border: OutlineInputBorder()),
                            ),




                    ],
                  ),
                ),
              ),


              SizedBox(height: 10.0),


              //Question 7
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '7-	Combien de nuits avez-vous passées en Haïti pendant ce séjour ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [


                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest7,
                              enabled: true,
                              decoration: InputDecoration(
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),


              //Question 8
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '8-	La/lesquelles de ces villes d’Haïti avez-vous visitées pendant votre séjour ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix8.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest8 = newValue!;
                                  if(newValue == "Autres"){
                                    _isTextFieldQ8 = true;
                                  }
                                  else{
                                    _isTextFieldQ8 = false;
                                    InputCtrlQuest8.text = "";
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest8,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest8,
                              enabled: _isTextFieldQ8,
                              decoration: InputDecoration(
                                  hintText: 'Autre',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),

              //Question 9
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '9-	Lequel (lesquels) de ces sites avez-vous fréquentés durant votre séjour ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),


                          DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix9.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest9 = newValue!;
                                  if(newValue == "Autres"){
                                    _isTextFieldQ9 = true;
                                  }
                                  else{
                                    _isTextFieldQ9 = false;
                                    InputCtrlQuest9.text = "";
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest9,
                                border: OutlineInputBorder(),
                              ),
                            ),


                          SizedBox(height: 10.0),

                          TextFormField(
                              controller: InputCtrlQuest9,
                              enabled: _isTextFieldQ9,
                              decoration: InputDecoration(
                                  hintText: 'Autre',
                                  border: OutlineInputBorder()),
                            ),




                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),

              //Question 10
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '10-	Lequel de ces moyens avez-vous utilisés pour faire vos réservations d’hôtel ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix10.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest10 = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest10,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 10.0),



              //Question 11
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '11-	Pour chacune des rubriques suivantes, indiquez le montant d’argent que vous avez dépensé au total (ou la personne qui a effectué le paiement) pendant le séjour en \$ US?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),

                      //Ques11 part 1
                      Row(
                        children: [

                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_A,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Prix du voyage"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_B,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Frais de logement"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),

                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_C,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Frais de transport"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 16.0),

                      //Ques11 part 2

                      Row(
                        children: [

                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_D,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Transport aérien interne"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_E,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Services ou assistance"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),

                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_F,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Restauration et boissons"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),

                        ],
                      ),


                      SizedBox(height: 16.0),

                      //Ques11 part 3

                      Row(
                        children: [

                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_G,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Souvenirs/Produits du terroir "),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_H,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Visite sites historiques"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),

                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_I,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Loisirs"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),

                          SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest10_J,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Autres"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),

                        ],
                      ),





                    ],
                  ),
                ),
              ),


              SizedBox(height: 10.0),


              //Question 12
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '12.	Selon vous, la qualité des services offerts par les  établissements touristiques est-elle excellente ou  pauvre ?  (évaluation sur une échelle de 1 à 10)',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),

                      //Quest12 part 1
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_A = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Restaurant /Bar"),
                                hintText: quest12_A,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),



                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_B = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Hébergements"),
                                hintText: quest12_B,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),





                        ],
                      ),



                      SizedBox(height: 10.0),



                      //Quest12 part 2
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_C = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Transport local"),
                                hintText: quest12_C,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),



                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_D = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Tours/Excursions"),
                                hintText: quest12_D,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),



                        ],
                      ),


                      SizedBox(height: 10.0),
                      //Quest12 part 3
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_E = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Sites historiques"),
                                hintText: quest12_E,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),



                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_F = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Sites naturels et culturels"),
                                hintText: quest12_F,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),



                        ],
                      ),


                      SizedBox(height: 10.0),
                      //Quest12 part 4
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_G = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Informations visiteurs"),
                                hintText: quest12_G,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),



                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_H = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Repas et boissons"),
                                hintText: quest12_H,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),



                        ],
                      ),


                      SizedBox(height: 10.0),
                      //Quest12 part 5
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_I = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Sécurité"),
                                hintText: quest12_I,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),



                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_J = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Propreté"),
                                hintText: quest12_J,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),


                          SizedBox(width: 16.0),



                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix12.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest12_K = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                label: Text("Personnel de service dans les hotels"),
                                hintText: quest12_K,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),



                        ],
                      ),






                    ],
                  ),
                ),
              ),



              SizedBox(height: 10.0),


              //Question 13
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '13-	Quel est le montant maximum que vous seriez prêt à payer pour visiter ce site? ',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),




                      //Quest12 part 2
                      Row(
                        children: [

                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest13_A,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("La Citadelle"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),

                          SizedBox(width: 16.0),

                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest13_B,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Palais Sans Souci"),
                                  hintText: '0',
                                  border: OutlineInputBorder()),
                            ),
                          ),




                        ],
                      ),









                    ],
                  ),
                ),
              ),



              SizedBox(height: 10.0),



              //Question 14
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '14-	Quelles activités et services auriez-vous aimé voir en plus?(cocher les 3 plus pertinent)',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),


                      new DropDownMultiSelect(
                        onChanged: (List<String> x) {
                          setState(() {
                            Q13Selected =x;
                          });
                        },
                        options: [
                          'Shopping / artisanat / produits locaux',
                          'Sites culturels et historiques',
                          'Nautisme & Visite des Îles',
                          'Restaurants',
                          'Vie nocturne / soirées',
                          'Randonnées et Tourisme en nature',
                          'Visites de production artisanale',
                          'Du bénévolat',
                          'Evénements et performances culturels',
                          'Autres',
                        ],
                        selectedValues: Q13Selected,
                        whenEmpty: 'Choisir',
                      ),

                    ],
                  ),
                ),
              ),


              SizedBox(height: 10.0),


              //Question 15
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '15- Envisagez-vous de retourner en Nord Haïti dans le futur ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix15.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest15 = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest15,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest15,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Pourquoi"),
                                  hintText: 'Pourquoi',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),



              //Question 16
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '16- Allez-vous recommander le Nord d’Haïti à d\'autres ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [

                          Expanded(
                            child: DropdownButtonFormField(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: DataForm.choix16.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  quest16 = newValue!;

                                });
                              },
                              decoration: InputDecoration(
                                hintText: quest16,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: InputCtrlQuest16,
                              enabled: true,
                              decoration: InputDecoration(
                                  label: Text("Pourquoi"),
                                  hintText: 'Pourquoi',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),


              //Question 17
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '17- Quelle a été l\'expérience la plus agréable pendant votre séjour dans le Nord d’Haïti? Pourquoi ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [


                          Expanded(
                            child: TextFormField(
                              maxLines: 10,
                              minLines: 5,
                              controller: InputCtrlQuest17,
                              decoration: InputDecoration(
                                  hintText: '...',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),

              //Question 18
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '18- Quelles ont été les difficultés principales / défis que vous avez rencontrés lors de votre séjour dans le nord d’Haïti? Pourquoi ?',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [


                          Expanded(
                            child: TextFormField(
                              maxLines: 10,
                              minLines: 5,
                              controller: InputCtrlQuest18,
                              decoration: InputDecoration(
                                  hintText: '...',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10.0),


              //Question 19
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '19- Commentaires et suggestions',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [


                          Expanded(
                            child: TextFormField(
                              maxLines: 10,
                              minLines: 5,
                              controller: InputCtrlQuest19,
                              decoration: InputDecoration(
                                  hintText: '...',
                                  border: OutlineInputBorder()),
                            ),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 10.0),

              new Center(
                  child: ElevatedButton(
                      onPressed: () => submitedFormRequest(),
                      child: Text("Envoyer")
                  ),
                ),



            ],
          ),
        ));
  }
}
