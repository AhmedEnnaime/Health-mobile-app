import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:e_sante/Main_pages/Acceuil.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController IP = TextEditingController();
  TextEditingController Mp = TextEditingController();
  final _formkey = GlobalKey <FormState> ();
  @override
  Widget build(BuildContext context) {
    double widthScreen=MediaQuery.of(context).size.width;
    double heightScreen=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
            children: [
              Container(
                width: widthScreen,
                height: heightScreen/0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/login.png'), fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: widthScreen/20, top: heightScreen/6),
                child: Text(
                  'Bienvenue',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              Container(
                height: heightScreen/1,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: heightScreen * 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key:_formkey,
                          child: Container(
                            margin: EdgeInsets.only(left: widthScreen/15.5, right: widthScreen/15.5),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller:IP,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "IP",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty || value == null){
                                      return 'Entrez votre IP';
                                    }else{
                                      return null;
                                    }
                                  },

                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller:Mp,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Mot de passe",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                  ),
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return 'Entrez mot de passe';
                                    }else if(value.length < 7){
                                      return'Mot de passe est court';
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: widthScreen/1.3,
                                  height: heightScreen/12,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "S'identifier",
                                        style: TextStyle(
                                            fontSize: 27, fontWeight: FontWeight.w700),
                                      ),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Color(0xff4c505b),
                                        child: IconButton(
                                            color: Colors.white,
                                            onPressed: () {
                                              if(_formkey.currentState!.validate()){

                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Acceuil()));
                                              }else{
                                                print('Unsuccess');
                                              }
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),

                                    Container(
                                      height: heightScreen/10,
                                      width: widthScreen/0.4,

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Mot de passe\n oublie?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  decoration: TextDecoration.underline,
                                                  color: Color(0xff4c505b),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            style: ButtonStyle(),
                                          ),
                                          SizedBox(width: 4,),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Mode spectateur',
                                                style: TextStyle(
                                                  decoration: TextDecoration.underline,
                                                  color: Color(0xff4c505b),
                                                  fontSize: 18,
                                                ),
                                              ),
                                          ),
                                        ],
                                      ),
                                    ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

      );

  }

}

