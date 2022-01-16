

// ignore_for_file: file_names, unused_element, camel_case_types, avoid_print, empty_constructor_bodies,  unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison, slash_for_doc_comments, unrelated_type_equality_checks
import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:flutter/widgets.dart';
import 'package:http/io_client.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
 import 'package:dio/dio.dart';
import '../main.dart';

class dbconnection {


  //this function open and connect to database and return Database value
 static Future<Database> get databaseConnect async{
         WidgetsFlutterBinding.ensureInitialized();
         //getting the path directory
         Directory pat = await getApplicationDocumentsDirectory();
         var realpath = join(pat.path, "luc.db");
         //open the database
         Database openDb= await openDatabase
              (realpath, 
              version: 1, 
              onCreate: (Database db, int version) 
                        async{
                              await db.execute(
                                            """CREATE TABLE enumeration(
                                              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
                                              title TEXT,
                                              first_name TEXT,
                                              middle_name TEXT,
                                              last_name TEXT,
                                              email TEXT,
                                              gender TEXT,
                                              phone_number TEXT,
                                              occupation TEXT,
                                              property_id TEXT,
                                              house_number TEXT,
                                              street TEXT,
                                              area TEXT,
                                              property_name TEXT,
                                              area_size TEXT,
                                              category TEXT,
                                              area_class TEXT,
                                              landmark TEXT,
                                              longitude TEXT,
                                              macAddress TEXT,
                                              latitude TEXT,
                                              imageName TEXT,
                                              property_type TEXT,
                                              zone TEXT,
                                              lga TEXT,
                                              building_purpose TEXT,
                                              building_type TEXT,
                                              agent_id TEXT,
                                              sendStatus TEXT,
                                              created_at TEXT)""",
                                    );
                                 await db.execute(
                                            """CREATE TABLE user(
                                              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
                                              email TEXT,
                                              password TEXT,
                                              created_at TEXT)""",
                                    );
                            });

       //  onUpgrade:  
             return openDb;
          
    }    


    /******************************** check propertyID Exist********************************************************************* */                
    static Future<bool> checkPropertyId(propertyId, dbconnect) async{
              //check if property id is already registered 
              List<Map<String, dynamic>> check_user =await dbconnect.query('enumeration', where: "property_id= ?", whereArgs: [propertyId]);
                if(check_user.isNotEmpty){
                   return true; 

                } else{
                   return false;
                }
          }
/***************************************************************************************************** */ 
 static Future<bool> checkUserEmail(username,dbconnect) async{
               WidgetsFlutterBinding.ensureInitialized();
                //getting the path directory
                Directory pat = await getApplicationDocumentsDirectory();
                var realpath = join(pat.path, "luc.db");
                print(await databaseExists(realpath));
                //open the database
                if( await databaseExists(realpath)){
                      //check if user is already registered 
                      List<Map<String, dynamic>> check_user =await dbconnect.query('user', where: "email= ?", whereArgs: [username]);
                      print(check_user);
                      if(check_user.isNotEmpty){
                        return true; 

                      } else{
                        return false;
                      }
                  }//end of db exist
                else{
                  // print("database noexist");
                  return false;
                }
            
          }
 /******************************** check propertyID Exist********************************************************************* */                
    static Future<String> updateEnumerationSentStatus(propertyId, dbconnect) async{
              
             int count = await dbconnect.rawUpdate('UPDATE enumeration SET sendStatus = ? WHERE property_id = ?', ["sent", propertyId]);
                 print(count);
                if(count>0){
                   return "success"; 
                } else{
                   return "failed";
                }
          }
/***************************************************************************************************** */ 
/******************************** Awiting property details ********************************************************************* */                
        static getAwaitingProperty(dbconnect) async{
              var Awaitingresponse = await dbconnect.query('enumeration', where: "sendStatus= ?", whereArgs: ["awaiting"]); 
              return Awaitingresponse.length;
          }
/***************************************************************************************************** */   
/******************************** Awiting property details ********************************************************************* */                
        static getSentProperty(dbconnect) async{
              var sentresponse = await dbconnect.query('enumeration', where: "sendStatus= ?", whereArgs: ["sent"]);
              return sentresponse.length;
          }
/***************************************************************************************************** */  
/******************************** getdate ********************************************************************* */                
        static getDate(dbconnect) async{
              var date = await dbconnect.query('enumeration', columns:['created_at']);
              print(date);        
          }
/***************************************************************************************************** */ 
/******************************** Awiting property details ********************************************************************* */                
        static getTotalProperty(dbconnect) async{
              var TotalProperty = await dbconnect.query('enumeration');
              return TotalProperty.length;
          }
/***************************************************************************************************** */ 
/******************************** check Db********************************************************************* */                
     static  Future<bool> dbExist() async{
               WidgetsFlutterBinding.ensureInitialized();
                //getting the path directory
                Directory pat = await getApplicationDocumentsDirectory();
                var realpath = join(pat.path, "luc.db");
                //open the database
                if( await databaseExists(realpath)){
                     // deleteDatabase(realpath);
                     // print("database deleted");
                      return true;
                }else{
                  // print("database noexist");
                  return false;
                }

          }
/***************************************************************************************************** */   
/******************************** user login function********************************************************************* */                
     static Future<String> user_login(String user_email, String user_password) async{
                          bool trustSelfSigned = true;
                          HttpClient httpClient = new HttpClient()
                            ..badCertificateCallback =
                                ((X509Certificate cert, String host, int port) => trustSelfSigned);
                          IOClient ioClient = new IOClient(httpClient);
                          var url = Uri.parse('https://www.luc.com/api/user_login_api.php');
                          final response = await ioClient.post(url,
                              // headers: {
                              //   HttpHeaders.contentTypeHeader: 'application/json',
                              //   //HttpHeaders.authorizationHeader: '',
                                
                              // },
                            body: {
                                      'email'   : user_email, 
                                      'password': user_password,
                                  }
                                              );
                          return response.body.trim();

                // var url = Uri.parse('https://www.luc.com/api/user_login_api.php');
                // //sending data to the server for login confirmation
                // var response = await http.post(
                //   url,
                //  body: {
                //        'email'   : user_email, 
                //        'password': user_password,
                //      }
                //      );
                // return response.body.trim();
            
      }
/***************************************************************************************************** */  
/******************************** ********************************************************************* */                
     static  sendPropertyToApi (
                                title,firstName,middleName,lastName,gender,email, 
                                phoneNumber,occupation,propertyId,houseNumber,street,area, 
                                propertyName,areaSize,category,areaClass,landmark,longitude , 
                                latitude,  imagePath, propertyType, zone, 
                                lga, buildingPurpose, buildingType, userId,macAddress
                                ) async{ 
                     

                           var formData= FormData.fromMap({
                                         'title' : title.toString(),
                                         "first_name" : firstName.toString(),
                                         "middle_name": middleName.toString(),
                                         "last_name" : lastName.toString(),
                                         "gender" : gender.toString(),
                                         "email" : email.toString(),
                                         "phone_number" : phoneNumber.toString(),
                                         "occupation" :  occupation.toString(),
                                         "property_id" :  propertyId.toString(),
                                         "house_number" :  houseNumber.toString(),
                                         "street" :  street.toString(),
                                         "area" :  area.toString(),
                                         "landmark" : landmark.toString(),
                                         "property_name" : propertyName.toString(),
                                         "property_type" : propertyType.toString(),
                                         "area_size" : areaSize.toString(),
                                         "building_type" : buildingType.toString(),
                                         "building_purpose" : buildingPurpose.toString(),
                                         "category" : category.toString(),
                                         "area_class" : areaClass.toString(),
                                         "lga" : lga.toString(),
                                         "zone" : zone.toString(),
                                         "agent_id" : userId.toString(),
                                         "mac_address" : macAddress.toString(),
                                         "latitude" : latitude.toString(),
                                         "longitude" : longitude.toString(),
                                          "image"   :  await MultipartFile.fromFile(imagePath, filename:"imag1.jpg"),
                                  });
                                    var dio=Dio();
                                   ( dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate=(client){
                                     client.badCertificateCallback=(X509Certificate cert, String host, int port){
                                       return true;
                                     };
                                   };
                                    var response=await dio.post('https://luc.com/api/enumeration_api.php', data:formData);      
                          return (response.data.toString());

            //  var request = http.MultipartRequest(
            //   'POST',
            //   Uri.parse('https://luc.com/api/enumeration_api.php', ));
            //   request.fields['title'] = title.toString();
            //   request.fields["first_name"] = firstName.toString();
            //   request.fields["middle_name"] = middleName.toString();
            //   request.fields["last_name"] = lastName.toString();
            //   request.fields["gender"] = gender.toString();
            //   request.fields["email"] = email.toString();
            //   request.fields["phone_number"] = phoneNumber.toString();
            //   request.fields["occupation"] = occupation.toString();
            //   request.fields["property_id"] = propertyId.toString();
            //   request.fields["house_number"] = houseNumber.toString();
            //   request.fields["street"] = street.toString();
            //   request.fields["area"] = area.toString();
            //   request.fields["landmark"] = landmark.toString();
            //   request.fields["property_name"] = propertyName.toString();
            //   request.fields["property_type"] = propertyType.toString();
            //   request.fields["area_size"] = areaSize.toString();
            //   request.fields["building_type"] = buildingType.toString();
            //   request.fields["building_purpose"] = buildingPurpose.toString();
            //   request.fields["category"] = category.toString();
            //   request.fields["area_class"] = areaClass.toString();
            //   request.fields["lga"] = lga.toString();
            //   request.fields["zone"] = zone.toString();
            //   request.fields["agent_id"] = userId.toString();
            //   request.fields["mac_address"] = macAddress.toString();
            //   request.fields["latitude"] = latitude.toString();
            //   request.fields["longitude"] = longitude.toString();
            //   request.files.add(await http.MultipartFile.fromPath('image', imagePath));
            //   //send to the api
            //   HttpOverrides.global = new MyHttpOverrides();
            //   var res = await request.send();

            //   //response from the api
            //   final response = await http.Response.fromStream(res);

            //   return (response.body);
            
      }
/***************************************************************************************************** */ 
static sendDemandNoticeToApi(propertyId, imagePath, isInternetAccess) async{

                    var formData= FormData.fromMap({
                                         'property_id'   :    propertyId.toString(),
                                         "image"   :  await MultipartFile.fromFile(imagePath, filename:"imag2.jpg"),
                                        });
										var dio=Dio();
									   ( dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate=(client){
										 client.badCertificateCallback=(X509Certificate cert, String host, int port){
										   return true;
										 };
									   };
										var response=await dio.post('https://luc.com/api/demand_notice_api.php', data:formData);      
										return (response.data.toString());

                
  //  var request = http.MultipartRequest(
  //             'POST',
  //             Uri.parse('https://luc.com/api/demand_notice_api.php', ));
  //             request.fields["property_id"] = propertyId.toString();
  //             request.files.add(await http.MultipartFile.fromPath('image', imagePath));
  //             //send to the api
  //             var res = await request.send();
  //             //response from the api
  //             final response = await http.Response.fromStream(res);
  //             return (response.body);
       
}
/*******************************************INSERT PROPERTY INTO DATABASE********************************************************** */  
   static Future<String> sendData (
             title,firstName,middleName,lastName,gender,email, 
             phoneNumber,occupation,propertyId,houseNumber,street,area, 
             propertyName,areaSize,category,areaClass,landmark,longitude , 
             latitude,  imageFile, propertyType, zone, 
             lga, buildingPurpose, buildingType, userId, dbconnect,_isInternetAccess,macAddress)async {
              
              // it must not be null but if null return empty error
              if(buildingPurpose==null || propertyType==null|| lga==null || zone==null){
                return "empty";
              }

              //getting the base name of the imageFile
              String imageName = basename(imageFile.path);
              //DATE FORMTA
              String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

                Map<String, dynamic> map= {
                        "title":          title,
                        "first_name" :    firstName,
                        "middle_name":    middleName,
                        "last_name" :     lastName,
                        "email"  :        email,
                        "gender" :        gender,
                        "phone_number" :  phoneNumber,
                        "occupation":     occupation,
                        "property_id" :   propertyId,
                        "house_number":   houseNumber,
                        "street" :        street,
                        "area" :          area,
                        "property_name" : propertyName,
                        "area_size" :     areaSize,
                        "category" :      category,
                        "area_class" :    areaClass,
                        "landmark" :      landmark,
                        "longitude" :     longitude,
                        "latitude" :      latitude,
                        "macAddress":     macAddress,
                        "imageName"   :   imageName,
                        "property_type" : propertyType,
                        "zone" :          zone,
                        "lga" :           lga,
                        "building_purpose" : buildingPurpose,
                        "building_type":  buildingType,
                        "agent_id" : userId,
                        "sendStatus" : "awaiting",
                        "created_at":now
                 };   
                 //check if property id exist 
                 //if exist dont save to the db
                  bool response= await checkPropertyId(propertyId,dbconnect);
                  if(response){
                    //property id exist
                    return "Property Exist";
                  }else{
                          //property id doesnot exist
                          //save the property to local db first 
                         await dbconnect.insert("enumeration", map);

                         //after saved is complete then send to the api if there is internet else return 
                         //property saved
                         //isInternetAccess is true if there is internet but false if no internet
                        switch (_isInternetAccess) {
                          case true:
                               var imagePath= imageFile.path;
                                String send_PropertyToApi_Response = await sendPropertyToApi(
                                          title,firstName,middleName,lastName,gender,email, 
                                          phoneNumber,occupation,propertyId,houseNumber,street,area, 
                                          propertyName,areaSize,category,areaClass,landmark,longitude , 
                                          latitude, imagePath, propertyType, zone, 
                                          lga, buildingPurpose, buildingType, userId,macAddress);
        
                                          if(send_PropertyToApi_Response=="success")
                                                {
                                                    var UpdateResponse= await updateEnumerationSentStatus(propertyId, dbconnect);
                                                        if(UpdateResponse =="success"){
                                                            return "success";
                                                        }else{
                                                          return "failed";
                                                        }
                                                }else{ return "Property not saved"; }
                          case false:
                                return "Property saved";
                          default:
                          return "Property saved";
                        }

                  }//end of property does not exist
    
             }//end of senddata
/***************************************************************************************************** */

/***************************************************************************************************** */
//the function will only be executed when refresh button is pressed;
//this method first check the enumeration table for all property with 
//sendStatus "awaiting". if check found then it will send automatically to the api 
//and after send is successfull then it goes back and update the sendStatus to sent;

static resendData(dbconnect,_isInternetAccess) async{
        var dir=await getApplicationDocumentsDirectory(); 
        //check enumeration where sendStatus=awaiting
        var response =await dbconnect.query('enumeration', where: "sendStatus= ?", whereArgs: ["awaiting"]); 
        //if response greater than 0 loop through 
        if(response.length > 0)
        {
              int i=0;
              switch (_isInternetAccess) 
                 {
                          case true:
                                do{
                                              var imagePath=dir.path+"/"+response[i]["imageName"];
                                              var send_PropertyToApi_Response = await sendPropertyToApi(
                                              response[i]["title"],response[i]["first_name"],response[i]["middle_name"],
                                              response[i]["last_name"],response[i]["gender"],response[i]["email"], 
                                              response[i]["phone_number"],response[i]["occupation"],response[i]["property_id"],
                                              response[i]["house_number"],response[i]["street"],response[i]["area"], 
                                              response[i]["property_name"],response[i]["area_size"],response[i]["category"],
                                              response[i]["area_class"],response[i]["landmark"],response[i]["longitude"] , 
                                              response[i]["latitude"], imagePath, response[i]["property_type"], response[i]["zone"], 
                                              response[i]["lga"], response[i]["building_purpose"], response[i]["building_type"], 
                                              response[i]["agent_id"],response[i]["macAddress"]);
                                              print(send_PropertyToApi_Response);
                                              if(send_PropertyToApi_Response=="" || send_PropertyToApi_Response=="success" || send_PropertyToApi_Response=="existed" ){
  
                                                        var UpdateResponse = await updateEnumerationSentStatus(response[i]["property_id"], dbconnect);
                                                  }else{ 
                                                            print("Property not sent");
                                                    
                                                     }
                                              print(send_PropertyToApi_Response);
                                              i++;                   
                                  } while(i < response.length);          
                                  break;
                            case false: print("return no internet");           
                  }
        }
 }
/*****************************************end of refresh button ************************************************************ */
/*****************************************Demand Notice ************************************************************ */

  static sendDemandNoticeData(propertyId, imageFile, isInternetAccess) async {
    switch (isInternetAccess) {
                          case true:
                               var imagePath= imageFile.path;
                                String send_DemandNotice_Response = await sendDemandNoticeToApi(propertyId, imagePath, isInternetAccess);
                                if (send_DemandNotice_Response=="success"){
                                       return "success";
                                }else{
                                        return "failed";
                                }     
                          case false:
                                return "No Internet";
                        
                        }
             
  }
/*****************************************Demand Notice ends here ************************************************************ */
/*****************************************saving user details start here ************************************************************ */
  static insertUserDetails(String username, String password, Database dbconnect) async{
                  //DATE FORMTA
              String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
                Map<String, dynamic> map= { 
                        "email"  :      username,
                        "password":     password,
                        "created_at":   now
                 };   
                 //check if property id exist 
                 //if exist dont save to the db
                  bool response= await checkUserEmail(username,dbconnect);
                  if(response){
                    //email exist
                    return "Email already exist";
                  }else{
                          //Email doesnot exist
                          //save the userdetails to local db first 
                         await dbconnect.insert("user", map);
                         return "saved";
                  }

  }
/*****************************************Saving user details ends here ************************************************************ */

}
 

 


