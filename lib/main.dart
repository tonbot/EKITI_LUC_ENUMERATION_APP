// ignore_for_file: prefer_const_constructors, avoid_print, override_on_non_overriding_member, non_constant_identifier_names, unnecessary_string_interpolations, slash_for_doc_comments, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:ekiti_luc/pages/dashboards.dart';
import 'package:ekiti_luc/pages/enumeration.dart';
import 'package:ekiti_luc/pages/demandNotice.dart';
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
   HttpOverrides.global = new MyHttpOverrides();
  runApp(MaterialApp(
    home:splash,
    routes: {
       "/login"    :(context)  => login(),
       "/dashboards" : (context) => dashboards(),
       "/enumeration"  : (context)  => enumeration(),
       "/demandNotice"  : (context)  => demandNotice(),
    },

  ));
} 

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient crea(SecurityContext context) {
      return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}