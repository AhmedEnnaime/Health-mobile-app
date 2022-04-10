import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:e_sante/variables.dart';
import 'package:http/http.dart' as http;
import 'package:e_sante/Data/User.dart';


class Ajouter_patient extends StatefulWidget {

  @override
  State<Ajouter_patient> createState() => _Ajouter_patientState();
}

class _Ajouter_patientState extends State<Ajouter_patient> {

  final _formkey1 = GlobalKey <FormState> ();
  TextEditingController Nom = TextEditingController();
  TextEditingController Ip = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController Tel = TextEditingController();
  TextEditingController Mail = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double WidthScreen=MediaQuery.of(context).size.width;
    double HeightScreen=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Padding(
          padding:  EdgeInsets.only(left: WidthScreen/20,right: WidthScreen/20),
          child: Row(
            children: [
              Icon(
                Icons.person_add,
                size: 30,
              ),
              SizedBox(width: 10,),
              Text(
                'Ajouter patient',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,



      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey1,
          child: Column(
            children: [
                Padding(
                  padding:  EdgeInsets.only(top: HeightScreen/20),
                  child: Text(
                    'Entrez les informations du patient',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Card(
                       margin: EdgeInsets.only(top: HeightScreen/15),
                       shape: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black,)
                       ),
                       child: Row(
                         children: [
                           Padding(
                             padding:  EdgeInsets.only(left: WidthScreen/30),
                             child: Text(
                                 'Homme',
                               style: TextStyle(
                                 fontSize: 16,
                               ),
                             ),
                           ),
                           SizedBox(width: 10,),
                           Radio<String>(
                             value: 'Homme',
                             groupValue: sex_val,
                             onChanged: (value){
                               setState(() {
                                 sex_val=value!;
                               });

                             },
                           ),

                         ],
                       ),
                     ),
                     SizedBox(width: 30,),
                     Card(
                       shape: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black,)
                       ),
                       margin: EdgeInsets.only(top: HeightScreen/15),
                       child: Row(
                         children: [
                           Padding(
                             padding:  EdgeInsets.only(left: WidthScreen/30),
                             child: Text(
                                 'Femme',
                               style: TextStyle(
                                 fontSize: 16,
                               ),

                             ),
                           ),
                           Radio<String>(
                             value: 'Femme',
                             groupValue: sex_val,
                             onChanged: (value){
                               setState(() {
                                 sex_val=value!;
                               });

                             },
                           ),
                         ],
                       ),

                     ),
                   ],
                 ),
              SizedBox(height: 50,),
              Card(
                margin: EdgeInsets.only(left: WidthScreen/20,right: WidthScreen/20),
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  controller: Nom,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Padding(
                      padding:  EdgeInsets.only(left: WidthScreen/30),
                      child: Icon(
                        Icons.supervised_user_circle_outlined,
                        color: Colors.red[400],
                      ),
                    ),
                    hintText: "Nom et prènom",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),


                ),
              ),
              SizedBox(height: 30,),
              Card(
                margin: EdgeInsets.only(left: WidthScreen/20,right: WidthScreen/20),
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  controller: Ip,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Padding(
                      padding:  EdgeInsets.only(left: WidthScreen/30),
                      child: Icon(
                        Icons.vpn_key,
                        color: Colors.red[400],
                      ),
                    ),
                    hintText: "Ip",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),


                ),
              ),
              SizedBox(height: 30,),
              Card(
                margin: EdgeInsets.only(left: WidthScreen/20,right: WidthScreen/20),
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  controller: Age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Padding(
                      padding:  EdgeInsets.only(left: WidthScreen/30),
                      child: Icon(
                        Icons.person,
                        color: Colors.red[400],
                      ),
                    ),
                    hintText: "Age",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Card(
                margin: EdgeInsets.only(left: WidthScreen/20,right: WidthScreen/20),
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  controller: Mail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Padding(
                      padding:  EdgeInsets.only(left: WidthScreen/30),
                      child: Icon(
                        Icons.mail,
                        color: Colors.red[400],
                      ),
                    ),
                    hintText: "Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Card(
                margin: EdgeInsets.only(left: WidthScreen/20,right: WidthScreen/20),
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  controller: Password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Padding(
                      padding:  EdgeInsets.only(left: WidthScreen/30),
                      child: Icon(
                        Icons.password,
                        color: Colors.red[400],
                      ),
                    ),
                    hintText: "Mot de passe",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Card(
                margin: EdgeInsets.only(left: WidthScreen/20,right: WidthScreen/20),
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  controller: Tel,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    focusColor: Color(0xffF5591F),
                    icon: Padding(
                      padding:  EdgeInsets.only(left: WidthScreen/30),
                      child: Icon(
                        Icons.phone,
                        color: Colors.red[400],
                      ),
                    ),
                    hintText: "Numéro de telephone",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: (){
                    adduser();
                  },
                  child: Text(
                    'Confirmer',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
              ),
              SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );

  }
  Future adduser() async {
    var APIURL = "http://10.0.2.2:3000/patients";
    Map mapeddata = {
      "Ip" : Ip.text,
      "Nom":Nom.text,
      "Sexe":sex_val,
      "Age":Age.text,
      "Mail":Mail.text,
      "Tel":Tel.text,
      "Password": Password.text,
    };
    http.Response reponse = await http.post(APIURL,body: mapeddata);
    var data = jsonDecode(reponse.body);
    print('DATA: ${data}');
  }
}
