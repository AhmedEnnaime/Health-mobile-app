import 'package:flutter/material.dart';
import 'package:e_sante/Toxicite_digestive/Nausees/Nausees_advices.dart';
import 'package:e_sante/Toxicite_digestive/Nausees/Nausees_survey5.dart';

class Nausees6 extends StatefulWidget {

  @override
  State<Nausees6> createState() => _Nausees6State();
}

class _Nausees6State extends State<Nausees6> {
  String val5='';
  TextEditingController traitement = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: Text(
          'Nausees/Vomissements',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(

          ),

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Card(
              margin: EdgeInsets.fromLTRB(15, 35, 16, 0),
              clipBehavior: Clip.antiAlias,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black,)
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Est-ce qu’un traitement ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'a été prescrit ? ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                      ],
                    ),

                    SizedBox(width: 35,),
                    Text(
                      'Oui',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Radio<String>(
                      value: 'Oui',
                      groupValue: val5,
                      onChanged: (value){
                        setState(() {
                          val5=value!;
                        });

                      },
                    ),
                    Text(
                      'Non',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Radio<String>(
                      value: 'Non',
                      groupValue: val5,
                      onChanged: (value){
                        setState(() {
                          val5=value!;
                        });
                      },
                    ),
                  ],
                ),
              ) ,
            ),
            SizedBox(height: 20,),
            Card(
                  margin: EdgeInsets.fromLTRB(15, 35, 16, 0),
                  clipBehavior: Clip.antiAlias,
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,)
                  ),
                  child: TextFormField(
                    controller: traitement,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Mentionnez le traitement et s'il ya une amelioration apres ce traitement",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),

                ),

            Padding(
              padding:  EdgeInsets.only(left: 30,top: 50),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.cyan[900],
                        minimumSize: Size(40, 40),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Nausees5()));

                    },
                    child: Text(
                      'Précedent',
                      style: TextStyle(
                          fontSize: 22
                      ),
                    ),
                  ),
                  SizedBox(width: 50,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.cyan[900],
                        minimumSize: Size(40, 40),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Nausees_advices()));

                    },
                    child: Text(
                      'Terminer',
                      style: TextStyle(
                          fontSize: 22
                      ),
                    ),
                  ),


                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}