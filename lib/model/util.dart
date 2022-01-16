// ignore_for_file: unused_catch_clause, non_constant_identifier_names, camel_case_types, prefer_const_constructors


import 'dart:io';

import 'package:dialogs/dialogs/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class util{
 //this class contains different functions which are not related

   

/// *********************************************************************************** */
 //this function check internet Access of the device
  static Future<bool> check_Internet_Access() async {
     
     try{
          var _isInternetAccess= await InternetAddress.lookup('www.gmail.com'); 
              if (_isInternetAccess.isNotEmpty){
                return true;
              }else{
                return false;
              }
       } on SocketException catch(e) {
          return false;
       }

  }
/************************************************************************************* */
/// *********************************************************************************** */
 //this function display snakBar
  static DisplaySnackBar(context, message) {
     
            var showSnackBar = (ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
                content:Text(message,
                style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
            duration: Duration(seconds:3),
          )));

          return showSnackBar ;

  }
/************************************************************************************* */
/// *********************************************************************************** */
  static DisplayAlertDialog(context,message,title) {
          MessageDialog messageDialog = MessageDialog(
                      dialogBackgroundColor: Colors.white,
                      buttonOkColor: Colors.red,
                      title: title,
                      titleColor: Colors.black,
                      message: message,
                      messageColor: Colors.black,
                      buttonOkText: 'Ok',
                      dialogRadius: 15.0,
                      buttonRadius: 18.0,
                      iconButtonOk: Icon(Icons.one_k));
                  messageDialog.show(context, barrierColor: Colors.white);
                  
                  return messageDialog;

  }
/// *********************************************************************************** */
 static DisplayProgressIndicator(context) {
            return showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black54,
                      ),
                    );
              });
            

  }

/// *********************************************************************************** */
static Future pickImages() async{
  
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera, imageQuality: 6);
    if (image != null ){
       final  directory = await getApplicationDocumentsDirectory();
       final  image_name = basename(image.path);
       final  newImage =  File('${directory.path}/$image_name');
       return File(image.path).copy(newImage.path);

    }else{
      return null;
    }

 }

/// ***************************set UserId starts here********************************************************************* */

  static Future<bool> setUserId(userID) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     if(await prefs.setString('userId',userID)){
           return true;
     }else{
          return false;
     }
     
}
/*****************************set UserId ends here********************************************************************* */

/// ***************************get UserId starts here********************************************************************* */

    static getUserId() async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var  userId = prefs.getString('userId').toString();
        return userId;
  }
/// ***************************get UserId ends here********************************************************************* */
 static determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission; 
  //check if location service is enabled
  //if not return a message
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) 
      {
       
        return ('Location services are disabled.');
        
      }
     //request for permission if permissiion==denied
  permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) 
        {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) 
            { 
              return Future.error('Permission denied');
            }
        }
 
   //At this point permission is granted
     await Geolocator.getCurrentPosition();
     return ("Permission granted");
    

}

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
