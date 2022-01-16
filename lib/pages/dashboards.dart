
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ekiti_luc/pages/decoration/decoration.dart';
import 'package:ekiti_luc/model/util.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ekiti_luc/model/dbconnection.dart';
import 'package:sizer/sizer.dart';


class dashboards extends StatefulWidget {
  const dashboards({ Key? key }) : super(key: key);

  @override
  _dashboardsState createState() => _dashboardsState();
}

class _dashboardsState extends State<dashboards> {

         var isInternetAccess=false;
         String internetStatus="Network Off";
         Color networkColor= Colors.red;
         var awaitingProperty="";
         var sentProperty="";
         var TotalProperty="";
         var userId;
         bool sendingVisibility=false;
////////////////////////////////////////////////////////////////////////
                resend() async {
                           setState(() {
                           sendingVisibility=true;
                        }); 
                      try{
                               var _isInternetAccess= await InternetAddress.lookup('www.gmail.com'); 
                              if (_isInternetAccess.isNotEmpty){
                               var dbconnect   =  await dbconnection.databaseConnect;    
                               await dbconnection.resendData(dbconnect, isInternetAccess);  
                                   setState(() {
                           sendingVisibility=false;
                        }); 
                          }else{
                                 setState(() {
                           sendingVisibility=false;
                        }); 
                          }
                      } on SocketException catch(e) {
                                 setState(() {
                           sendingVisibility=false;
                        }); 
                      }
                  
                }
/////////////////////////////////////////////////////////////

//////////////////////////////// a global functions that perform many function ///////////////////////////////////////////////////////////////
         globalFunction() async {

                  //making a database object
                  var dbconnect   =  await dbconnection.databaseConnect;                                                                      
                   //changing state of some property
                       var awaitingPropertyResponse  =  await dbconnection.getAwaitingProperty(dbconnect);
                       var sentPropertyResponse      =  await dbconnection.getSentProperty(dbconnect);
                       var TotalPropertyResponse     =  await dbconnection.getTotalProperty(dbconnect);
                        setState(() {
                            awaitingProperty = awaitingPropertyResponse.toString();
                            sentProperty     = sentPropertyResponse.toString();
                            TotalProperty    = TotalPropertyResponse.toString();
                        });                  
                
                  //checking internet Status
                     try{
                      var _isInternetAccess= await InternetAddress.lookup('www.gmail.com'); 
                      if (_isInternetAccess.isNotEmpty){
                          setState(() {
                              isInternetAccess = true;
                              internetStatus="Network On";
                              networkColor= Colors.green;
                          });
                             
                        return true;                            
                      }else{
                        setState(() {
                              isInternetAccess = false;
                              internetStatus="Network Off";
                              networkColor= Colors.red;
                          });  
                      }   
                      } on SocketException catch(e) {
                             sendingVisibility=false;
                      }
                 
                        return false; 
  } 
/////////////////////////////////////////////////////////////////////////////////////////////////////
        //this function get user id in localStorage Preference
        getUserId() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
           userId = prefs.getString('userId').toString();
           setState(() {
             userId = userId;
           });
        }
/////////////////////////////////////////////////////////////////////////////////////////////////////
 

        
        @override
        void initState(){
          super.initState();
            globalFunction(); 
            getUserId();
        }
   

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:Colors.blueGrey,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: Text("Dashboard",
                  style: TextStyle(
                    fontSize:17,
                    color: white,
                  ),
                  ),
          ),
              ),
        body:ListView(
          children:[
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20,20,0,0),
                   child: Text("Hello!",
                       style: TextStyle(
                         fontSize:15,
                         fontWeight:FontWeight.bold,
                         color: Colors.pink,
                       ),
                       ),
                 ),

                    Padding(
                     padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      child: Text (userId.toString(), //userId
                       style: TextStyle(
                         fontSize:14,
                         fontWeight:FontWeight.bold,
                         color: Colors.black,
                       ),
                       ),
                    ),
                    SizedBox(height: 10,),
///////////////////////////////section two start here////////////////////////////////////////////////////
             Container(  //this is the container for network status
            color:Colors.black12,
            height:110,
            padding:const EdgeInsets.fromLTRB(10,10,10,10),
            child: Column(
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     GestureDetector(
                        onTap:() async{
                          var res= await globalFunction();
                          res? setState(() {
                                    isInternetAccess = true;
                                    internetStatus="Network On";
                                    networkColor= Colors.green;
                                    sendingVisibility=false;
                                }):setState(() {
                                    isInternetAccess = false;
                                    internetStatus="Network Off";
                                    networkColor= Colors.red;
                                    sendingVisibility=false;

                                });
                        },
                       child: Container(
                         alignment:Alignment.center,
                         height:51,
                         width:51,
                         decoration: BoxDecoration(
                           color: black,
                            borderRadius: BorderRadius.circular(100.0),
                         ),
                         child: Icon(Icons.refresh,
                         color: white,
                         ),
                       ),
                     ),
                     SizedBox(width: 40,),
                      Container(
                       alignment:Alignment.center,
                       height:51,
                       width:51,
                       decoration: BoxDecoration(
                         color: isInternetAccess? green: Colors.red,
                          borderRadius: BorderRadius.circular(100.0),
                       ),
                       child: Icon(Icons.wifi,
                       color: white,
                       ),
                      ),
                      SizedBox(width: 40,),
                      GestureDetector(
                        onTap:() async{
                
                          await resend();
                          var res= await globalFunction();
                          res? setState(() {
                                    isInternetAccess = true;
                                    internetStatus="Network On";
                                    networkColor= Colors.green;
                                    sendingVisibility=false;
                                }):setState(() {
                                    isInternetAccess = false;
                                    internetStatus="Network Off";
                                    networkColor= Colors.red;
                                    sendingVisibility=false;

                                });
                        },
                        child: Container(
                         alignment:Alignment.center,
                         height:51,
                         width:51,
                         decoration: BoxDecoration(
                           color:black,
                            borderRadius: BorderRadius.circular(100.0),
                         ),
                         child: Icon(Icons.upload,
                               color:yellow,
                           ),
                                           ),
                      ),
                   ],
                 ),
                Row(// row for label
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                          
                          SizedBox(
                            width:15.w,
                            child: Text("Refresh Page",
                            style:TextStyle(
                              color:black,
                            ),
                            ),
                          ),
                           SizedBox(width: 40,),
                          SizedBox(
                            width:15.w,
                            child: Text(internetStatus,
                            style:TextStyle(
                              color:networkColor,
                            ),
                            ),
                          ),
                           SizedBox(width: 40,),
                          SizedBox(
                            width:15.w,
                            child: Text("Resend Details",
                            style:TextStyle(
                              color:black,
                            ),
                            ),
                          ),
                  ]
                ), //for internet ends her
              ],
            ),
          ),
///////////////////////////////section two ends here////////////////////////////////////////////////////
            SizedBox(
                height:10,
              ),
           //Sychronization section starts here
            Visibility(
              visible:sendingVisibility,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color:Colors.blue,
                  ),
                  Text("Please wait Syncroniztion in Progress"),
                ],
              )
            ),
            //sychronization  section ends here
//////////////////////////////////section three start here////////////////////////////////////////////////////
          SizedBox(
            height:10,
          ),
            Row(
                    children: [   
                       Expanded(
                         flex:1,
                         child: SizedBox(
                           child: Center(
                             child: Text("Awaiting Property Details",                        
                               style:TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize:12,
                               ),
                             ),
                           ),
                         ),
                       ),
                     
                      Expanded(
                          flex:1,
                          child: SizedBox(
                           child: Center(
                             child: Text("Sent Property Details",                        
                               style:TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize:12,
                               ),
                             ),
                           ),
                                               ),
                        ),
                    ],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Expanded(
                         flex:1,
                         child: SizedBox(
                           child: Center(
                             child: Text(awaitingProperty,                        
                               style:TextStyle(
                                  color:Colors.red, 
                                 fontWeight: FontWeight.bold,
                                 fontSize:16,
                               ),
                             ),
                           ),
                         ),
                       ),
                     
                         Expanded(
                           flex:1,
                           child: SizedBox(    
                           child: Center(
                             child: Text(sentProperty,            
                               style:TextStyle(
                                 color:Colors.red, 
                                 fontWeight: FontWeight.bold,
                                 fontSize:16,
                               ),
                             ),
                           ),
                                                ),
                         ),
                    ],
                  ),
                  //spacce
//////////////////////////////////section three ends here////////////////////////////////////////////////////
                           GestureDetector(
                      onTap:(){

                         util.DisplayProgressIndicator(context);
                         
                         Future.delayed(Duration(seconds: 2)).then
                           (  (value) {               
                                    Navigator.pushReplacementNamed(context, "/enumeration"); 
                                },
                             );

                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20,20,20,0),
                        child: Container( //enumeration container
                          decoration:BoxDecoration(borderRadius: BorderRadius.circular(25.0), 
                          color:Colors.black87,
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
                                       fontSize:20,
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
                    ),
                      //second container demand notice
                       GestureDetector(
                     onTap:(){

                         util.DisplayProgressIndicator(context);
                         
                         Future.delayed(Duration(seconds: 2)).then
                           (  (value) {               
                                    Navigator.pushReplacementNamed(context, "/demandNotice"); 
                                },
                             );

                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20,10,20,0),
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
                                       fontSize:20,
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
                    ),   
                     //third container container History
                       GestureDetector(
                     onTap:(){

                        //  util.DisplayProgressIndicator(context);
                         
                        //  Future.delayed(Duration(seconds: 2)).then
                        //    (  (value) {               
                        //             Navigator.pushReplacementNamed(context, "/demandNotice"); 
                        //         },
                        //      );

                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20,10,20,40),
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
                                     child: Text("View History",
                                     style:TextStyle(
                                       color:Colors.white,
                                       fontWeight:FontWeight.bold,
                                       fontSize:20,
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
                    ),    //History ends here 
          ],
        )
    );
      }
  );
  }
}