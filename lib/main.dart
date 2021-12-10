// ignore_for_file: prefer_const_constructors, avoid_print, override_on_non_overriding_member, non_constant_identifier_names, unnecessary_string_interpolations, slash_for_doc_comments, prefer_const_literals_to_create_immutables

import 'package:ekiti_luc/pages/dashboard.dart';
import 'package:ekiti_luc/pages/enumeration.dart';
import 'package:ekiti_luc/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


void main(){

    Widget splash = SplashScreenView(
      navigateRoute:login(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/images/ekirs.png",
      text:"LAND USE CHARGE",
      backgroundColor: Colors.grey[200],
    );

  runApp(MaterialApp(
    home:splash,
    routes: {
       "/login"    :(context)  => login(),
       "/dashboard" : (context) => dashboard(),
       "/enumeration"  : (context)  => enumeration(),
    },

  ));
}