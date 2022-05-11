import 'dart:ui';
import 'package:e_sante/Data/Doctor_Data/Doctor_Model.dart';
import 'package:e_sante/Data/Patient_Data/User.dart';
import 'package:e_sante/Data/Rdv_patient_Data/Implement_Rdv_patient.dart';
import 'package:e_sante/Data/Rdv_patient_Data/Rdv_patient_Model.dart';
import 'package:e_sante/Data/Rdv_patient_Data/Rdv_patient_controller.dart';
import 'package:e_sante/Data/Toxicity_Data/Fievre_Data/Fievre_Model.dart';
import 'package:e_sante/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_sante/Main_pages/Sidebar.dart';
import 'package:e_sante/Evaluation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_sante/Data/Question_Libre_Data/Question_Model.dart';
import 'package:e_sante/Data/Question_Libre_Data/Implement_Question.dart';
import 'package:e_sante/Data/Question_Libre_Data/Question_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Data/Patient_Data/Patient_data.dart';
import '../Data/Patient_Data/patient_controller.dart';
import 'package:e_sante/Data/Cures_Data/Cures_controller.dart';
import 'package:e_sante/Data/Cures_Data/Implement_cures.dart';
import 'package:e_sante/Data/Cures_Data/Cures_Model.dart';


class Acceuil extends StatefulWidget {

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  var patientcontroller= Patientcontroller(Patients_data());
  TextEditingController question_controller = TextEditingController();
  var questioncontroller = Questioncontroller(Question_Data());
  Patient _patient = Patient();
  late YoutubePlayerController _controller;
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  void runYoutubePlayer(){
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=Vl-wmC4Hs-w')!,
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
        )
    );
  }
  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
    _controller = new YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=Vl-wmC4Hs-w')!,);
    _controller1 = new YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=MuXVu1KBxN8')!,);
    _controller2 = new YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=HPFZkSr04Rk')!,);
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double WidthScreen =MediaQuery.of(context).size.width;
    double HeightScreen =MediaQuery.of(context).size.height;
    var curecontroller = Curescontroller(Cures_Data());
    var rdv_patientcontroller = Rdv_patientcontroller(Rdv_patient_Data());

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
          leading: Builder(builder: (context){
            return IconButton(
              onPressed: () =>Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu,
                color: Colors.red[400],
                size: 40,
              ),
            );
          }),
          backgroundColor: Colors.cyan[900],
          shape: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFEF5350),
            ),
          ),
          title: FutureBuilder<List<Patient>>(
            future: patientcontroller.fetchPatientList(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                if (snapshot.hasError){
                  return Center(child: Text('${snapshot.error}'),);
                }
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ( context, index) {
                    var patient = snapshot.data?[index];
                    return Text(
                            'Bonjour ${patient?.Nom}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                  },
                  itemCount:  snapshot.data?.length ?? 0, separatorBuilder: ( context,  index) {
                    return  Divider(
                      //thickness:0.5 ,
                      //height: 0.5,
                    );
                },

                );
              }
          ),

          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications,
                  color: Colors.red[400],
                  size: 40,
                )
            )
          ],
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(HeightScreen/14),
              child: Container(

              )

          )
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.fromLTRB(0, 20, 130, 0),
                child: Text(
                    'Conseils generaux',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                height: HeightScreen/5.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                                'assets/cigarette.png',
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            ),

                          ),
                          radius: 40,
                          backgroundColor: Colors.pink[50],
                        ),
                        Column(
                          children: [
                            TextButton(
                              child: Text(
                                  'Cessez de\nfumer',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),

                              ),
                              onPressed: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Fumer()));
                                showDialog(context: context, builder: (context)=>AlertDialog(
                                  actions: [
                                    Container(
                                      child: YoutubePlayerBuilder(
                                        player: YoutubePlayer(controller: _controller2),
                                        builder: (context,player){
                                          return player;
                                        },
                                      ),
                                      width: WidthScreen,
                                      height: HeightScreen/3,
                                    ),
                                  ],

                                ),
                                  barrierDismissible: true
                                );

                              },
                            ),

                          ],
                        )

                      ],

                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                                'assets/surpoids.png',
                              fit: BoxFit.cover,

                            ),

                          ),
                          radius: 40,
                          backgroundColor: Colors.pink[50],
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Surpoids()));
                                showDialog(context: context, builder: (context)=>AlertDialog(
                                  actions: [
                                    Container(
                                      child: YoutubePlayerBuilder(
                                        player: YoutubePlayer(controller: _controller1),
                                        builder: (context,player){
                                          return player;
                                        },
                                      ),
                                      width: WidthScreen,
                                      height: HeightScreen/3,
                                    ),
                                  ],

                                ),
                                  barrierDismissible: true
                                );

                              },
                              child: Text(
                                  'Evitez le\nsurpoids',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black
                                ),
                              ),

                            ),
                          ],
                        )

                      ],

                    ),

                    SizedBox(width: 20,),
                    Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/alcol.png',
                              fit: BoxFit.cover,
                            ),

                          ),
                          radius: 40,
                          backgroundColor: Colors.pink[50],
                        ),

                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                showDialog(context: context, builder: (context)=>AlertDialog(
                                  actions: [
                                Container(
                                  child: YoutubePlayerBuilder(
                                  player: YoutubePlayer(controller: _controller),
                                    builder: (context,player){
                                      return player;
                                    },
                                  ),
                                  width: WidthScreen,
                                  height: HeightScreen/3,
                                ),
                                  ],

                                ),
                                  barrierDismissible: true
                                );

                              },
                              child: Text(
                                  'Evitez de\nl alcol',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black
                                ),
                              ),

                            ),
                          ],
                        )

                      ],

                    ),

                    SizedBox(width: 10,),
                    Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                                'assets/food.png',
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                            ),

                          ),
                          radius: 40,
                          backgroundColor: Colors.pink[50],
                        ),

                        Column(
                          children: [
                            TextButton(
                              onPressed: () {

                              },
                              child: Text(
                                'Consommez les\nfruits et legumes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black
                                ),
                              ),

                            ),
                          ],
                        )

                      ],

                    ),

                    SizedBox(width: 10,),
                    Column(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                                'assets/active.png',
                              fit: BoxFit.cover,
                            ),

                          ),
                          radius: 40,
                          backgroundColor: Colors.pink[50],
                        ),

                        Column(
                          children: [
                            TextButton(
                              onPressed: () {  },
                              child: Text(
                                'Soyez active\nau quotidien',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black
                                ),
                              ),

                            ),

                          ],
                        )

                      ],

                    ),

                    SizedBox(width: 20,),

                  ],
                ),
              ),
              SizedBox(height: 20,),

              CarouselSlider(
                items: [
                  Container(
                    width: WidthScreen/1.1,
                    height: HeightScreen/4,
                    child: Card(
                        margin: EdgeInsets.only(left: WidthScreen/120,right: WidthScreen/100),

                        color: Colors.cyan[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: WidthScreen/190,top: HeightScreen/60),
                              child: Image.asset(
                                'assets/nurse.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: HeightScreen/30,left: WidthScreen/120),
                              child: Column(
                                children: [
                                  Text(
                                    'N oubliez pas de\n passer l evaluation\n general le debut de\n chaque mois',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 2,),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green[400],
                                    ),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Evaluation()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Passer',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        )
                    ),
                  ),
                  Container(
                    width: WidthScreen/1.1,
                    height: HeightScreen/4,
                    child: Card(
                        margin: EdgeInsets.only(left: WidthScreen/120,right: WidthScreen/100),

                        color: Colors.cyan[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: WidthScreen/190,top: HeightScreen/60),
                              child: Image.asset(
                                'assets/question_doctor.png',
                                width: 100,
                                height: 120,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: HeightScreen/30,left: WidthScreen/120),
                              child: Column(
                                children: [
                                  Text(
                                    "Vous avez une \nquestion ? N'hésitez\n pas a  demander \nà votre medecin",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 2,),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.yellow,
                                    ),
                                    onPressed: (){
                                      showDialog(context: context, builder: (context)=>AlertDialog(
                                        title: Text('Poser votre question '),
                                        actions: [
                                          Card(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: question_controller,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: 'Poser votre question',
                                                  enabledBorder: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                ),

                                              ),
                                            ),
                                            shape: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.black,),
                                                borderRadius: BorderRadius.circular(14)
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: (){
                                              Question question = Question(Question_contenu:question_controller.text,Patient_Ip: IP.text,Doctor_Ip:_patient.Doctor_Ip );
                                              questioncontroller.postQuestion(question);
                                            },
                                            child: Text(
                                              'Envoyer',
                                              style: TextStyle(
                                                  fontSize: 18
                                              ),
                                            ),
                                          )
                                        ],


                                      ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        'Poser question',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        )
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 180,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16/9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,

                ),

              ),

              SizedBox(height: 30,),


                CarouselSlider(
                             items: [
                               FutureBuilder<List<Cures_Model>>(
                                 future: curecontroller.getCures(),
                                 builder: ( context, snapshot) {
                                   if(snapshot.connectionState == ConnectionState.waiting){
                                     return Center(child: CircularProgressIndicator(),);
                                   }
                                   if (snapshot.hasError){
                                     return Center(child: Text('${snapshot.error}'),);
                                   }
                                   return ListView.separated(
                                       itemBuilder: (context, index) {
                                         var cures = snapshot.data?[index];
                                             return Column(
                                               children: [
                                                 Padding(
                                                   padding:  EdgeInsets.only(right: WidthScreen/5),
                                                   child: Text(
                                                     'Prochaine Cure',
                                                     style: TextStyle(
                                                         fontSize: 18,
                                                         fontWeight: FontWeight.bold
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   child: Card(
                                                     color: Colors.cyan[100],
                                                     shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.circular(20),

                                                     ),
                                                     child: Column(
                                                       children: [
                                                         Padding(
                                                           padding:  EdgeInsets.only(top: HeightScreen/20),
                                                           child: Row(
                                                             children: [
                                                               Padding(
                                                                 padding:  EdgeInsets.only(left: WidthScreen/40),
                                                                 child: Icon(
                                                                   Icons.calendar_today_rounded,
                                                                   size: 25,
                                                                 ),
                                                               ),
                                                               SizedBox(width: 10,),
                                                               Text(
                                                                 '${cures?.Next_cure}',
                                                                 style: TextStyle(
                                                                   fontSize: 16,
                                                                 ),
                                                               ),
                                                               SizedBox(width: 30,),
                                                               Icon(
                                                                 Icons.schedule,
                                                                 size: 25,
                                                               ),
                                                               SizedBox(width: 10,),
                                                               Padding(
                                                                 padding:  EdgeInsets.only(right: WidthScreen/50),
                                                                 child: Text(
                                                                   '3:00 PM',
                                                                   style: TextStyle(
                                                                     fontSize: 16,
                                                                   ),
                                                                 ),
                                                               ),

                                                             ],
                                                           ),
                                                         ),
                                                         SizedBox(height: 50,),
                                                         Row(
                                                           children: [
                                                             Padding(
                                                               padding:  EdgeInsets.only(left: WidthScreen/50),
                                                               child: Icon(
                                                                 Icons.local_hospital,
                                                                 size: 30,
                                                               ),
                                                             ),
                                                             SizedBox(width: 10,),
                                                             Text(
                                                               'CHU \nMarrakech',
                                                               textAlign: TextAlign.center,
                                                               style: TextStyle(
                                                                 fontSize: 16,
                                                               ),
                                                             ),
                                                             SizedBox(width: 25,),
                                                             Icon(
                                                               Icons.phone,
                                                               size: 25,
                                                             ),
                                                             SizedBox(width: 10,),
                                                             Text(
                                                               '0524300700',
                                                               style: TextStyle(
                                                                 fontSize: 16,
                                                               ),
                                                             ),

                                                           ],
                                                         ),
                                                         SizedBox(height: 40,),
                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                               ],
                                             );
                                     
                                   }, separatorBuilder: (BuildContext context, int index) { return Divider(); }, itemCount:  snapshot.data?.length ?? 0,
                                   );
                                 },
                                 
                               ),
                               FutureBuilder<List<Rdv_patient>>(
                                 future:rdv_patientcontroller.getRdv_patient() ,
                                 builder: ( context,  snapshot) {
                                   if(snapshot.connectionState == ConnectionState.waiting){
                                     return Center(child: CircularProgressIndicator(),);
                                   }
                                   if (snapshot.hasError){
                                     return Center(child: Text('${snapshot.error}'),);
                                   }
                                   return ListView.separated(
                                       itemBuilder: (context, index) {
                                         var rdv_patient = snapshot.data?[index];
                                         return Column(
                                           children: [
                                             Padding(
                                               padding:  EdgeInsets.only(right: WidthScreen/5),
                                               child: Text(
                                                 'Prochain rendez-vous',
                                                 style: TextStyle(
                                                     fontSize: 18,
                                                     fontWeight: FontWeight.bold
                                                 ),
                                               ),
                                             ),
                                             Container(
                                               child: Card(
                                                 color: Colors.cyan[100],
                                                 shape: RoundedRectangleBorder(
                                                   borderRadius: BorderRadius.circular(20),

                                                 ),
                                                 child: Column(
                                                   children: [
                                                     Padding(
                                                       padding:  EdgeInsets.only(top: HeightScreen/40),
                                                       child: Center(
                                                         child: Text(
                                                           'Consulation',
                                                           style: TextStyle(
                                                               fontSize: 16,
                                                               color: Colors.redAccent
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                     SizedBox(height: 25,),
                                                     Row(
                                                       children: [
                                                         Padding(
                                                           padding:  EdgeInsets.only(left: WidthScreen/40),
                                                           child: Icon(
                                                             Icons.calendar_today_rounded,
                                                             size: 25,
                                                           ),
                                                         ),
                                                         SizedBox(width: 10,),
                                                         Text(
                                                           '${rdv_patient?.Day}',
                                                           style: TextStyle(
                                                             fontSize: 16,
                                                           ),
                                                         ),
                                                         SizedBox(width: 30,),
                                                         Icon(
                                                           Icons.schedule,
                                                           size: 25,
                                                         ),
                                                         SizedBox(width: 10,),
                                                         Padding(
                                                           padding:  EdgeInsets.only(right: WidthScreen/100),
                                                           child: Text(
                                                             '${rdv_patient?.rdv_temps}',
                                                             style: TextStyle(
                                                               fontSize: 16,
                                                             ),
                                                           ),
                                                         ),

                                                       ],
                                                     ),
                                                     SizedBox(height: 23,),
                                                     Row(
                                                       children: [
                                                         Padding(
                                                           padding:  EdgeInsets.only(left: WidthScreen/50),
                                                           child: Icon(
                                                             Icons.local_hospital,
                                                             size: 30,
                                                           ),
                                                         ),
                                                         SizedBox(width: 10,),
                                                         Text(
                                                           'CHU \nMarrakech',
                                                           textAlign: TextAlign.center,
                                                           style: TextStyle(
                                                             fontSize: 16,
                                                           ),
                                                         ),
                                                         SizedBox(width: 25,),
                                                         Icon(
                                                           Icons.phone,
                                                           size: 25,
                                                         ),
                                                         SizedBox(width: 10,),
                                                         Text(
                                                           '0524300700',
                                                           style: TextStyle(
                                                             fontSize: 16,
                                                           ),
                                                         ),

                                                       ],
                                                     ),
                                                     SizedBox(height: 5,),

                                                     ElevatedButton(
                                                         style: ElevatedButton.styleFrom(
                                                             primary: Colors.red[400]
                                                         ),
                                                         onPressed: () {},
                                                         child: Text(
                                                           'Annulez rendez-vous',
                                                           style: TextStyle(
                                                               fontSize: 16
                                                           ),
                                                         )
                                                     )
                                                   ],
                                                 ),
                                               ),
                                             ),
                                           ],
                                         );
                                     
                                   }, separatorBuilder: (BuildContext context, int index) { return Divider(); }, itemCount: snapshot.data?.length ?? 0,
                                   );
                                   
                                 },
                                 
                               ),
                             ],
                             options: CarouselOptions(
                               height: 300,
                               enlargeCenterPage: true,
                               autoPlay: true,
                               aspectRatio: 16/9,
                               autoPlayCurve: Curves.fastOutSlowIn,
                               enableInfiniteScroll: true,
                               autoPlayAnimationDuration: Duration(milliseconds: 800),
                               viewportFraction: 0.8,
                             ),
                           ),
            ],
          ),

        ),
      ),

    );
  }
}
