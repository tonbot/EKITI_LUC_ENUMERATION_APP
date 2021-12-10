

// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_field


import 'dart:io';
import 'package:ekiti_luc/model/util.dart';
import 'package:ekiti_luc/model/dbconnection.dart';
import 'package:flutter/material.dart';


class login extends StatefulWidget  {
  const login({ Key? key }) : super(key: key);
 
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>  {
         
      
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
       bool  _isObscure = true;
        
       Color SubmitButtonBgColor = Colors.red;
       Color SubmitButtonTextColor = Colors.white;
        //  color declaration ends here
       
       // Variable Declaration
     
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      TextEditingController      usernameController    = TextEditingController();
      TextEditingController      passwordController = TextEditingController();
      
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       // key: scaffoldKey,
       body: SafeArea(
          child: Container(
            color:Colors.grey[200], //background color of the parent container
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,0),
              child: ListView(
                
                children:<Widget>[  //list view of children starts here

                     //space 
                     SizedBox( height:80, ),

                    //login text
                     SizedBox(
                        child:Text(
                          "Welcome back",
                          style:TextStyle(
                              fontSize: 35,
                              fontWeight:FontWeight.bold,
                              fontFamily: "arial",
                              color:TextBorderColor,
                          ),
                        )
                        ),
                    //login text

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
                                    " Enter Username",
                                    style:TextStyle(
                                        fontSize:17,
                                        color:Colors.black,
                                        fontFamily:"roboto",
                                    ),
                                    )
                                  ),
                                  
                                  //space
                                  SizedBox( height:15, ),
                 
                                TextFormField( //user name text field

                                      validator: (data){
                                           if(data == "" || data == null){
                                               return "Email field cannot be empty";
                                           }else{
                                             return null ;
                                           }
                                      },


                                      controller:usernameController,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),

                                      decoration:InputDecoration(
                                          prefixIcon: Icon(Icons.people),
                                          hintText:"Email",
                                          hintStyle: TextStyle(color:Colors.black26, fontSize:15),
                                          fillColor:Colors.white,
                                          filled: true,
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:TextBorderFocusColor,
                                                width:TextBorderFocusWidth,
                                              ),
                                              borderRadius: BorderRadius.circular(25.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:TextBorderEnabledColor,
                                                width:TextBorderEnabledWidth,

                                              )
                                          ),
                                          errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:TextBorderErrorColor,
                                                width:TextBorderErrorWidth,
                                              )
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:TextBorderColor,
                                                width:TextBorderwidth,
                                              )
                                          ),
                                      )

                                ),

                                    
                                     SizedBox( height:15, ),


                                   Container(  //label username
                                  height:20,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    " Enter Password",
                                    style:TextStyle(
                                        fontSize:17,
                                        color:Colors.black,
                                        fontFamily:"roboto",
                                    ),
                                    )
                                  ),
                                  
                                  //space
                                  SizedBox( height:15, ),
                 
                              TextFormField( //password text field

                                      validator: (data2){
                                           if(data2 == "" || data2 == null){
                                               return "Password field cannot be empty";
                                           }else{
                                             return null ;
                                           }
                                      },


                                      controller:passwordController,
                                      style: TextStyle(color:Colors.black, fontSize: 17 ),
                                      obscureText: _isObscure,
                                      
                                      decoration:InputDecoration( 
                                          hintText:"Password",
                                          prefixIcon: Icon(Icons.lock),
                                          suffixIcon: IconButton(
                                             icon:Icon(Icons.remove_red_eye),
                                            onPressed: (){
                                              setState(() {
                                                  _isObscure ? _isObscure=false : _isObscure = true; 
                                              });
                                              
                                            },
                                            ),
                                          hintStyle: TextStyle(color:Colors.black26, fontSize:15),
                                          fillColor:Colors.white,
                                          filled: true,
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:TextBorderFocusColor,
                                                width:TextBorderFocusWidth,
                                              ),
                                              borderRadius: BorderRadius.circular(25.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:TextBorderEnabledColor,
                                                width:TextBorderEnabledWidth,

                                              )
                                          ),
                                          errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:TextBorderErrorColor,
                                                width:TextBorderErrorWidth,
                                              )
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:TextBorderColor,
                                                width:TextBorderwidth,
                                              )
                                          ),
                                      ),
                                              
                                ),
                                 
                                 //space
                                  SizedBox( height:50, ),
                                 
                                GestureDetector( //on tap of a sign in button
                                        onTap: () async{

                                          //check internet connection
                                          bool _isInternetAccess = await util.check_Internet_Access();

                                          if (_isInternetAccess) //have internet access
                                              {            
                                                    bool isValid = _formKey.currentState!.validate();
                                                    if(isValid)
                                                      {
                                                              //getting the form field value
                                                              String   username  = usernameController.text;
                                                              String   password  = passwordController.text;
                                                          
                                                              //veryfying user authencity
                                                              String response= await dbconnection.user_login(username,password);
                                                               if (response == "success"){

                                                                    //display Progress Indicator  
                                                                    util.DisplayProgressIndicator(context) ;

                                                                  Future.delayed(Duration(seconds: 2)).then //delayed this function for 2 seconds
                                                                     (  (value) async{   
                                                                                 
                                                                                 //store userId
                                                                               bool isUserID= await util.setUserId(username);
                                                                               isUserID == true? Navigator.pushReplacementNamed(context, "/dashboard"):Navigator.pop(context); 
                                                                    
                                                                          },
                                                                      );

                                                               }else{
                                                                        //no user found
                                                                       util.DisplayAlertDialog(context);
                                                               }
                                               
                                                      }
                                                }
                                           else{ //no internet access
                                                     
                                                     //display snack bar
                                                     String message="Oops, looks like there's no internet connection";
                                                     util.DisplaySnackBar(context, message);
                    
                                                }

                                          

                                        },

                                  child: Container(   //sign in Contain
                                     padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                     alignment:Alignment.center,
                                     child: Text(
                                       "SIGN IN",
                                       style: TextStyle(
                                       color:SubmitButtonTextColor,
                                     ), 
                                     ),
                                     color: SubmitButtonBgColor,
                                  ),
                                ),
          
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