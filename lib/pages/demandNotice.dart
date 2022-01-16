
// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'dart:io';
import 'package:ekiti_luc/model/enumField.dart';
import 'package:flutter/material.dart';
import 'package:ekiti_luc/model/util.dart';
import 'package:sqflite/sqflite.dart';
import 'decoration/decoration.dart';
import 'package:ekiti_luc/model/dbconnection.dart';


class demandNotice extends StatefulWidget {
  const demandNotice({ Key? key }) : super(key: key);

  @override
  _demandNoticeState createState() => _demandNoticeState();
}

class _demandNoticeState extends State<demandNotice> {

             final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
             bool sendingVisibility=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      //appBar
       appBar:AppBar(
         title: Center(child: Text("Demand Notice",
         style:TextStyle(
           fontSize:15,
         ),
         )),
         backgroundColor:Colors.blueGrey,
          ),
          body:SafeArea(
            child: Container(
               color:Colors.grey[200], //background color of the parent container
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30,20,20,20),
                // ignore: duplicate_ignore
                child: ListView(
                  children:<Widget>[  //list view of children starts here
                      //login text
                       SizedBox(
                          child:Text(
                            "Demand Notice",
                            style:TextStyle(
                                fontSize: 25,
                                fontWeight:FontWeight.bold,
                                fontFamily: "arial",
                                color:Colors.black45,
                              ),
                            )
                          ),
                          
                      //
                     SizedBox( height:5,),

                    //
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,180,0),
                      child: Container(
                        height:5,
                        color:Colors.red,
                        width:2,
                        child:Text(""),
                      ),
                    ),

                      //space 
                     SizedBox( height:40, ),
/*********************************************property id starts here**************************************************** */
                                   Container(  //label Property Id
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Property Id",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 Form(
                                   key:_formKey,
                                   child:TextFormField( //user name text field
                                        controller:enumField.demandpropertyId_Controller,
                                        validator:(value) {
                                          if(value=="" || value==null || value.length != 7){
                                          return "Property Id cannot be less or greater than 7digits";
                                        }else{
                                           /// check if the string contains only numbers
                                            RegExp _numeric = RegExp(r'^-?[0-9]+$');                                         
                                            bool check_numeric = _numeric.hasMatch(value);
                                           if (check_numeric){
                                               return null;
                                           }else{
                                              return "Property Id can only be number";
                                           }
                                         
                                            }
                                        },
                                        style: TextStyle(color:Colors.black, fontSize: 17 ),
                                        decoration:TextFieldDecoration.copyWith(hintText:"014757"),
                                    ),
                                 ),
/*********************************************property id ends here**************************************************** */
                             
                                  //space
                                     SizedBox( height:12, ),
/***********************************************Image selection starts here****************************************************** */
                                     GestureDetector(
                                       onTap:()  async {
                                           demandimages = await util.pickImages();
                                         setState((){
                                           demandimage = demandimages;
                                         });
                                     //   Navigator.pushReplacementNamed(context, "/dashboards"); 
                                       },
                                       child: Container(
                                         alignment: Alignment.centerLeft,
                                         child: SizedBox( 
                                         child:Row(
                                           children: [
                                             Icon(Icons.camera_alt,
                                             size: 50,),
                                             Text("Tap the camera Icon to take a picture"),
                                           ],
                                         )
                                         ),
                                       ),
                                     ),

                                     SizedBox( height:15, ),
                                    Center(
                                      child:Container(
                                        child: demandimage !=null ? Image.file( File(demandimage.path),
                                        width:160,
                                        height:160,
                                        fit:BoxFit.cover,
                                        ):Text("No Image Selected"),
                                        width:150,
                                        height:150,
                                        decoration:BoxDecoration(
                                         borderRadius: BorderRadius.circular(100.0),
                                       
                                        )
                                      )
                                    ),
                                    
                                     SizedBox( height:15, ),

/******************************************** Image Selection Ends here************************************************************************* */
                          GestureDetector(
                            onTap: () async{
                                          //validate form data
                                          bool isValid = _formKey.currentState!.validate();
                                           if (isValid && demandimages != null)
                                              {     
                                                    //check for internet
                                                    bool _isInternetAccess = await util.check_Internet_Access();
                  
                                                             image_Controller = demandimages;
                                                            
                                                             //making dconnection                                                 
                                                              Database dbconnect= await dbconnection.databaseConnect;

                                                              // ignore: unnecessary_null_comparison
                                                              if(dbconnect != null )
                                                              {
                                                                      setState(() {
                                                                           sendingVisibility=true;
                                                                       });
                                                                      
                                                                    var response = await dbconnection.sendDemandNoticeData(
                                                                            
                                                                              enumField.demandpropertyId_Controller.text.toString(),
                                                                              image_Controller,
                                                                              _isInternetAccess,

                                                                               ); 
                                                                    
                                                                     setState(() {
                                                                         sendingVisibility=false;
                                                                      });
                                                                     
                                                                    if(response=="success"){
                                                                      setState(() {
                                                                         sendingVisibility=false;
                                                                      });
                                                                     
                                                                      String message="Demand Image Saved";
                                                                      String title="Success";
                                                                      util.DisplayAlertDialog(context, message, title);
                                                                    }else if(response=="No Internet"){
                                                                      setState(() {
                                                                         sendingVisibility=false;
                                                                      });
                                                                      String message="Please connect to the internet";
                                                                      String title="NETWORK ERROR";
                                                                      util.DisplayAlertDialog(context, message, title);
                                                                    }
                                                                    else{
                                                                      setState(() {
                                                                         sendingVisibility=false;
                                                                      });
                                                                      String message="Demand image already exist or Enumeration details does not exist for this property id";
                                                                      String title="CANT SAVE DEMAND IMAGE";
                                                                      util.DisplayAlertDialog(context, message, title);
                                                                    }

                                                                    //await dbconnection.checkDb(dbconnect);
                                                               }//end of if dbconnection is not null
                                                          
                                                  
                                              }  
                                          else{
                                              setState(() {          
                                                          sendingVisibility=false;
                                                         });
                                              }

                            },
                            child: Container(   //sign in Contain
                                       padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                       child: Row(
                                         mainAxisAlignment:MainAxisAlignment.center,
                                         children: [
                                           Text(
                                             "SUBMIT",
                                             style: TextStyle(
                                             color:SubmitButtonTextColor,
                                           ), 
                                           ),
                                           SizedBox(width:10),
                                           Visibility(
                                             visible:sendingVisibility?true: false,
                                             child: SizedBox(
                                               height:20,
                                               width:20,
                                               child: CircularProgressIndicator(
                                                 color:Colors.white,
                                                 strokeWidth:2.0,
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                       color: SubmitButtonBgColor,
                                    ),
                          ),
/*********************************************property id starts here**************************************************** */
 
                     ]   //login tex
                ),
              ),
            ),
          )
      );
  }
}
