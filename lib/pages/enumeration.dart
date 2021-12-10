
// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ekiti_luc/model/util.dart';
import 'package:ekiti_luc/model/dbconnection.dart';
import 'package:ekiti_luc/model/enumField.dart';
import 'package:ekiti_luc/pages/decoration/decoration.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_field


class enumeration extends StatefulWidget {
  const enumeration({ Key? key }) : super(key: key);

  @override
  _enumerationState createState() => _enumerationState();
}

class _enumerationState extends State<enumeration> {
       // Variable Declaration
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
        
      //appBar
       appBar:AppBar(
         title: Center(child: Text("Eumeration Details",
         style:TextStyle(
           fontSize:15,
         )
         
         )),
         backgroundColor:Colors.blueGrey,
          ),

       // key: scaffoldKey,
       body: SafeArea(
          child: Container(
            color:Colors.grey[200], //background color of the parent container
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30,20,20,20),
              child: ListView(
                
                children:<Widget>[  //list view of children starts here

                    //login text
                     SizedBox(
                        child:Text(
                          "Property Details",
                          style:TextStyle(
                              fontSize: 25,
                              fontWeight:FontWeight.bold,
                              fontFamily: "arial",
                              color:Colors.black45,
                          ),
                        )
                        ),
                    //login text

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

                     //formcontainer
                      Form(
                            key:_formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Container(  //label username
                                  height:20,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Title",
                                    style:TextStyle(
                                        fontSize:17,
                                        color:Colors.black,
                                        fontFamily:"roboto",
                                    ),
                                    )
                                  ),
                                  
                                  //space
                                  SizedBox( height:12, ),
                 
                                TextFormField( //user name text field
                                      controller:enumField.title_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration,
                                ),

                                    //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "First Name",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //First Name 
                                      controller:enumField.firstName_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"Oladele"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Middle Name",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.middleName_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"Olajide"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Last Name",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.lastName_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"Olawole"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Gender",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.gender_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"Male/Female"),
                                ),
                                   //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Email",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.email_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"example@gmail.com"),
                                ),   
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Phone Number",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.phoneNumber_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"08000007788"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Occupation",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.occupation_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"Lawyer"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
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
                 
                                 TextFormField( //user name text field
                                      controller:enumField.propertyId_Controller,
                                      validator:(value) {
                                        if(value=="" || value==null){
                                          return "Property Id can not be empty";
                                        }else{
                                          return null;
                                        }
                                      },
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"014757"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "House Number",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //House Number
                                      controller:enumField.housenumber_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"A16"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Street",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //Street
                                      controller:enumField.street_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"Tope Alabi Street"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label Area
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Area",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //Area
                                      controller:enumField.area_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"Fajuyi Area"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label Property Name
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Property Name",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.propertyName_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"King's Palace"),
                                ),
                                  //space
                                    SizedBox( height:12, ),

                                    Container(  //label Property Name
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "LandMark",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.landmark_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"CAPTAIN COOK"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                             
                                    Container(  //label Area Size
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Area Size",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.areaSize_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"50km"),
                                ),
                                  //space

                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Category",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.category_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"A"),
                                ),
                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Area Class",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                 TextFormField( //user name text field
                                      controller:enumField.areaClass_Controller,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      decoration:TextFieldDecoration.copyWith(hintText:"GRA"),
                                ),
                                  //space
                                      SizedBox( height:12, ),
                                            Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Property Type",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                IgnorePointer(
                                  ignoring:false,
                                  child: DropdownButtonFormField<String>(  //property type
         
                                    value: PropertyType_selectedValue,
                                
                                    //hint designs
                                    hint: Text("Select Property Type",
                                    style: TextStyle(color:Colors.black26, fontSize:18)
                                    ),
                                  
                                    //list of item
                                    items:enumField.PropertyTypeList.map((String val) {
                                              return DropdownMenuItem<String>(value: val, child: Text(val,), );   
                                    }).toList(),
                                
                                    //onchanged
                                    onChanged: (value) {

                                            setState(() {
                                                 PropertyType_selectedValue =  value.toString();
                                                 Zone_selectedValue=null;
                                                 BuildingType_selectedValue=null;
                                                 BuildingPurpose_selectedValue=null;

                                            });
                                     },
                                      decoration:dropDownDecoration,
                                  ),
                                ),

                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Building Type",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                  DropdownButtonFormField<String>(  //Building Type
                                 // controller: "propertyType_Controller",
                     
                                  value:BuildingType_selectedValue,
                                   
                                   //disable hint
                                  disabledHint:Text(" Selection Disabled ",
                                  style: TextStyle(color:Colors.black26, fontSize:15)
                                  ),

                                  //hint designs
                                  hint: Text("Select Building Type",
                                  style: TextStyle(color:Colors.black26, fontSize:18)
                                  ),

                                  //list of item
                                  items:enumField.getBuildingType(PropertyType_selectedValue).map((String val) {
                                            return DropdownMenuItem<String>(value: val, child: Text(val,), );   
                                  }).toList(),
                                  
                                  //onchanged
                                  onChanged: (value) {
                                          setState(() {
                                             BuildingType_selectedValue =  value.toString();

                                          });
                                               
                                   },
                                    decoration:dropDownDecoration,
                                ),

                                  //space
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Building Purpose",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                   DropdownButtonFormField<String>(  //property zone
                                 // controller: "propertyType_Controller",
                     
                                  value:BuildingPurpose_selectedValue, 

                                  disabledHint:Text(" Selection Disabled ",
                                  style: TextStyle(color:Colors.black26, fontSize:15)
                                  ),

                                  //hint designs
                                  hint: Text("Select Building Purpose",
                                  style: TextStyle(color:Colors.black26, fontSize:18)
                                  ),

                                  //list of item
                                  items:enumField.getBuildingPurpose(PropertyType_selectedValue).map((String val) {
                                            return DropdownMenuItem<String>(value: val, child: Text(val,), );   
                                  }).toList(),
                                  
                                  //onchanged
                                  onChanged: (value) {
                                          setState(() {
                                             BuildingPurpose_selectedValue =  value.toString();
                                          });
                                               
                                   },
                                    decoration:dropDownDecoration,
                                ),

                                     SizedBox( height:12, ),
                                     
                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "LGA",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                   DropdownButtonFormField<String>(  //property zone
                                   // controller: "propertyType_Controller",

                                  //disable designs
                                  disabledHint:Text(" Selection Disabled ",
                                  style: TextStyle(color:Colors.black26, fontSize:15)
                                  ),
                                   
                                   //hint
                                  hint: Text("Select Property L.G.A",
                                  style: TextStyle(color:Colors.black26, fontSize:18)
                                  ),

                                  isExpanded: true,
                                 
                                  //list of item
                                  items: enumField.getLga.map((String val)  {
                                            return DropdownMenuItem<String>(value: val, child: Text(val,), );   
                                  }).toList(),
                                  
                                  value:Lga_selectedValue,
                                  //onchanged
                                  onChanged: (data) {
                                          setState(() {

                                              Lga_selectedValue =  data.toString();

                                          }); 
                                          
                                   },
                                  
                                    decoration:dropDownDecoration,
                                ),
                                     SizedBox( height:12, ),

                                    Container(  //label username
                                      height:20,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Property Zone",
                                        style:TextStyle(
                                            fontSize:17,
                                            color:Colors.black,
                                            fontFamily:"roboto",
                                        ),
                                        )
                                      ),
                                      
                                      //space
                                      SizedBox( height:12, ),
                 
                                  DropdownButtonFormField<String>(  //property zone
                                   // controller: "propertyType_Controller",

                                  //disable designs
                                   disabledHint:Text(" Selection Disabled ",
                                  style: TextStyle(color:Colors.black26, fontSize:15)
                                  ),
                                   
                                   //hint
                                  hint: Text("Select Property Zone",
                                  style: TextStyle(color:Colors.black26, fontSize:18)
                                  ),

                                  isExpanded: true,
                                 
                                  //list of item
                                  items: enumField.getZone(PropertyType_selectedValue).map((String val)  {
                                            return DropdownMenuItem<String>(value: val, child: Text(val,), );   
                                  }).toList(),
                                  
                                  value:Zone_selectedValue,
                                  //onchanged
                                  onChanged: (data) {
                                          setState(() {

                                              Zone_selectedValue =  data.toString();

                                          }); 
                                          
                                   },
                                  
                                    decoration:dropDownDecoration,
                                ),

                                     SizedBox( height:15, 
                                     ),
/***********************************************Image selection starts here****************************************************** */
                                     GestureDetector(
                                       onTap:()  async {
                                           images = await util.pickImages();
                                         setState((){
                                           image = images;
                                         });
                                        
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
                                        child: image !=null ? Image.file( File(image.path),
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
/******************************************** Image Selection Ends here************************************************************************* */
                                 //space
                                  SizedBox( height:50, ),
 /*****************************************BUTTON SUBMIT************************************************** */
                                GestureDetector( //on tap of submit
                                        onTap: () async{ 
                                     
                                          //get userID
                                          userId=await util.getUserId();
                                          //print(userId);

                                          //validate form data
                                          bool isValid = _formKey.currentState!.validate();

                                          if (isValid && images != null)
                                              {     
                                                // if there is internet access data will be saved to the local
                                                // database and then proceed to send to the api
                                                // but if there is no internet access data will only be saved to the local
                                                // database and then sent automatically later when device has internet access.

                                                   // check internet connection. the function returns "true" if there is internet
                                                   // but returns false if there is no internet access
                                                    bool _isInternetAccess = await util.check_Internet_Access();
                                                    if (_isInternetAccess) //have internet access
                                                          {            
                                                             image_Controller = images;
                                                             var macAddress= "";
                                                          
                                                             //making dconnection                                                 
                                                                Database dbconnect= await dbconnection.databaseConnect;
                                                             // print(dbconnect);
                                                                
                                                               //bool checkK= await dbconnection.dbExist();
                                                              // print(checkK);

                                                              if(dbconnect !=null ){
                                                                    var response = await dbconnection.sendData(
                                                                        
                                                                              enumField.title_Controller.text.toString(),
                                                                              enumField.firstName_Controller.text.toString(),
                                                                              enumField.middleName_Controller.text.toString(),
                                                                              enumField.lastName_Controller.text.toString(),
                                                                              enumField.gender_Controller.text.toString(),
                                                                              enumField.email_Controller.text.toString(),
                                                                              enumField.phoneNumber_Controller.text.toString(),
                                                                              enumField.occupation_Controller.text.toString(),
                                                                              enumField.propertyId_Controller.text.toString(),
                                                                              enumField.housenumber_Controller.text.toString(),
                                                                              enumField.street_Controller.text.toString(),
                                                                              enumField.area_Controller.text.toString(),
                                                                              enumField.propertyName_Controller.text.toString(),
                                                                              enumField.areaSize_Controller.text.toString(),
                                                                              enumField.category_Controller.text.toString(),
                                                                              enumField.areaClass_Controller.text.toString(),
                                                                              enumField.landmark_Controller.text.toString(),
                                                                              longitude_Controller.toString(),
                                                                              latitude_Controller.toString(),
                                                                              image_Controller,                                                                            
                                                                              PropertyType_selectedValue,
                                                                              Zone_selectedValue,
                                                                              Lga_selectedValue,
                                                                              BuildingPurpose_selectedValue,
                                                                              BuildingType_selectedValue,
                                                                              userId,
                                                                              dbconnect,
                                                                              _isInternetAccess,
                                                                              macAddress,   
                                                                    );
                                                                    print(response);
                                                                  await dbconnection.checkDb(dbconnect);
                                                             }//end of if dbconnection is not null
                                                          }
                                                    else{ //no internet access    
                                                              //display snack bar
                                                              String message="Oops, looks like there's no internet connection";
                                                              util.DisplaySnackBar(context, message);
                                                          }
                                              }  
                                          else{
                                                print("false");
                                              }         
                                        },
                                  child: Container(   //sign in Contain
                                     padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                     alignment:Alignment.center,
                                     child: Text(
                                       "SUBMIT",
                                       style: TextStyle(
                                       color:SubmitButtonTextColor,
                                     ), 
                                     ),
                                     color: SubmitButtonBgColor,
                                  ),
                                ),
      /*****************************************BUTTON SUBMIT************************************************** */
                              ],
                            ),                           
                        ),
                     //formcontainer
                ],
              ),
            ),
          ),
        ),
      );
  }
}