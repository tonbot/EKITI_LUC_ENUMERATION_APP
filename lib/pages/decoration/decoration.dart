// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

       bool isVisible=true;
       Color TextBorderColor = Colors.blueGrey;
       Color TextBorderErrorColor= Colors.red;
       Color TextBorderFocusColor= Colors.blueGrey;
       Color TextBorderEnabledColor= Colors.blueGrey;

       Color SelectBoxButtonFillColor= Colors.green;
     
       double TextBorderwidth         = 2;
       double TextBorderErrorWidth    = 2;
       double TextBorderFocusWidth    = 2;
       double TextBorderEnabledWidth   = 2;
        
       Color SubmitButtonBgColor = Colors.red;
       Color SubmitButtonTextColor = Colors.white;
        //  color declaration ends here
       // Variable Declaration
     
var dropDownDecoration = InputDecoration(
                                            hintText:"30km",
                                            hintStyle: TextStyle(color:Colors.black26, fontSize:18),
                                            fillColor:SelectBoxButtonFillColor,
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
                                        );

var TextFieldDecoration=InputDecoration(
                                          hintText:"Mr/Mrs/Dr",
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
                                      );