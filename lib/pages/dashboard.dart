// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:ekiti_luc/model/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class dashboard extends StatefulWidget {
  
  const dashboard({ Key? key }) : super(key: key);

  @override
  
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

           
            
         // ignore: prefer_final_fields
        
      //  color declaration
 
       bool isVisible=true;
       Color TextBorderColor = Colors.red;
       Color TextBorderErrorColor= Colors.red;
       Color TextBorderFocusColor= Colors.red;
       Color TextBorderEnabledColor= Colors.red;
     
       double TextBorderwidth         = 2;
       double TextBorderErrorWidth    = 2;
       double TextBorderFocusWidth    = 2;
       double TextBorderEnabledWidth   = 2;
        
       Color SubmitButtonBgColor = Colors.red;
       Color SubmitButtonTextColor = Colors.white;
        //  color declaration ends here
       
       // Variable Declaration
     
      TextEditingController      usernameController    = TextEditingController();
      TextEditingController      passwordController = TextEditingController();
       var userId; 
       
       //this function get user id in localStorage Preference
        getUserId() async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
           userId = prefs.getString('userId').toString();
           setState(() {
             userId = userId;
           });
        }
       
        @override
  void initState() {
          super.initState();
            getUserId();
        }

  @override
   Widget build(BuildContext context){
     
   return  Scaffold(
       body: SafeArea(
          child: Container(
            color:Colors.grey[200], //background color of the parent container
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,0),
              child: ListView(
                children:<Widget>[  //list view of children starts here
     
                     Text("Hello!",
                     style: TextStyle(
                       fontSize:20,
                       fontWeight:FontWeight.bold,
                       color: Colors.pink,
                     ),
                     ),

                       SizedBox(height: 10,),

                       Text (userId.toString(), //userId
                     style: TextStyle(
                       fontSize:25,
                       fontWeight:FontWeight.bold,
                       color: Colors.black,
                     ),
                     ),
                      SizedBox(height: 40,),
                    GestureDetector(
                      onTap:(){

                         util.DisplayProgressIndicator(context);
                         
                         Future.delayed(Duration(seconds: 2)).then
                           (  (value) {               
                                    Navigator.pushReplacementNamed(context, "/enumeration"); 
                                },
                             );

                      },
                      child: Container( //enumeration container
                        decoration:BoxDecoration(borderRadius: BorderRadius.circular(25.0), 
                        color:Colors.black,
                        ),         
                        padding: EdgeInsets.fromLTRB(20,40,20,40),
                        child:Row(
                          children: [
                            SizedBox(
                              child:Icon(Icons.home, size:100, color:Colors.orange),
                            ),
                          
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                    
                                 Container(
                                   width:150,
                                   alignment:Alignment.centerLeft,
                                   child: Text("Start Enumeration",
                                   style:TextStyle(
                                     color:Colors.white,
                                     fontWeight:FontWeight.bold,
                                     fontSize:26,
                                     fontFamily:"roboto"
                                   )
                                   ),
                                 ),
                                 Container(
                                   alignment:Alignment.centerLeft,
                                   child: Text("Please fill out your Property details her!",
                                    style:TextStyle(
                                     color:Colors.orange,
                                     fontWeight:FontWeight.bold,
                                     fontSize:14,
                                   )
                                   ),
                                   width:150
                                 ),
                              
                               ],
                             ),
                            
                          ],
                        ) ,
                      ),
                    ),
                   
                    //space
                     SizedBox(height: 25,),
                    //second container demand notice
                       GestureDetector(
                      onTap:(){
                         util.DisplayProgressIndicator(context);                        
                      },
                      child: Container( //Demand Notice
                        decoration:BoxDecoration(borderRadius: BorderRadius.circular(25.0), 
                        color:Colors.black87,
                        ),         
                        padding: EdgeInsets.fromLTRB(20,40,20,40),
                        child:Row(
                          children: [
                            SizedBox(
                              child:Icon(Icons.photo_album_outlined, size:100, color:Colors.green[200]),
                            ),
                          
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                    
                                 Container(
                                   width:150,
                                   alignment:Alignment.centerLeft,
                                   child: Text("Demand Notice",
                                   style:TextStyle(
                                     color:Colors.white,
                                     fontWeight:FontWeight.bold,
                                     fontSize:26,
                                     fontFamily:"roboto"
                                   )
                                   ),
                                 ),
                                 Container(
                                   alignment:Alignment.centerLeft,
                                   child: Text("Send us a photo of your Property here!",
                                    style:TextStyle(
                                     color:Colors.green[200],
                                     fontWeight:FontWeight.bold,
                                     fontSize:14,
                                   )
                                   ),
                                   width:150
                                 ),
                              
                               ],
                             ),
                            
                          ],
                        ) ,
                      ),
                    ),



                ],
              ),
            ),
          )
        ),
      );
  }
}