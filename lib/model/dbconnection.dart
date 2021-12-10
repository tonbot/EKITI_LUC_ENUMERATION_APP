

// ignore_for_file: file_names, unused_element, camel_case_types, avoid_print, empty_constructor_bodies,  unused_local_variable, non_constant_identifier_names, unnecessary_null_comparison, slash_for_doc_comments, unrelated_type_equality_checks
import 'dart:io';
import 'package:ekiti_luc/model/enumField.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
class dbconnection {


  //this function open and connect to database and return Database value
 static Future<Database> get databaseConnect async{
         WidgetsFlutterBinding.ensureInitialized();
         //getting the path directory
         Directory pat = await getApplicationDocumentsDirectory();
         var realpath = await join(pat.path, "luc.db");
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
                                              created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""",
                                    );
                             
                            });

       //  onUpgrade:  
             return openDb;
          
    }    


    /******************************** check propertyID Exist********************************************************************* */                
    static Future<bool> checkPropertyId(propertyId, dbconnect) async{
              //check if user is already registered 
              List<Map<String, dynamic>> check_user =await dbconnect.query('enumeration', where: "property_id= ?", whereArgs: [propertyId]);
                 
                if(check_user.isNotEmpty){
                   return true; 

                } else{
                   return false;
                }
          }
/***************************************************************************************************** */ 
/******************************** check Db********************************************************************* */                
      static checkDb(dbconnect) async{
        
                  var count = await dbconnect.rawQuery('SELECT * FROM enumeration');
                  for(int i=0; i < count.length; i++){
                      print(count[i]["first_name"]);
                  }
          }
/***************************************************************************************************** */   

/******************************** check Db********************************************************************* */                
     static  Future<bool> dbExist() async{
               WidgetsFlutterBinding.ensureInitialized();
                //getting the path directory
                Directory pat = await getApplicationDocumentsDirectory();
                var realpath = await join(pat.path, "luc.db");
                //open the database
                if( await databaseExists(realpath)){
                      // deleteDatabase(realpath);
                      return true;
                }else{
                  return false;
                }

          }
/***************************************************************************************************** */   
/******************************** ********************************************************************* */                
     static Future<String> user_login(String user_email, String user_password) async{

                var url = Uri.parse('https://www.luc.ekitistaterevenue.com/api/user_login_api.php');
                //sending data to the server for login confirmation
                var response = await http.post(
                  url,
                 body: {
                       'email'   : user_email, 
                       'password': user_password,
                     }
                     );
                return response.body.trim();
            
      }
/***************************************************************************************************** */  
/******************************** ********************************************************************* */                
     static  sendPropertyToApi (
                                title,firstName,middleName,lastName,gender,email, 
                                phoneNumber,occupation,propertyId,houseNumber,street,area, 
                                propertyName,areaSize,category,areaClass,landmark,longitude , 
                                latitude,  imageFile, propertyType, zone, 
                                lga, buildingPurpose, buildingType, userId,macAddress
                                ) async{

             var request = http.MultipartRequest(
              'POST',
              Uri.parse('https://www.ggcom.com.ng/luc/api/enumeration_api.php',  ));

              request.fields['title'] = title.toString();
              request.fields["first_name"] = firstName.toString();
              request.fields["middle_name"] = middleName.toString();
              request.fields["last_name"] = lastName.toString();
              request.fields["gender"] = gender.toString();
              request.fields["email"] = email.toString();
              request.fields["phone_number"] = phoneNumber.toString();
              request.fields["occupation"] = occupation.toString();
              request.fields["property_id"] = propertyId.toString();
              request.fields["house_number"] = houseNumber.toString();
              request.fields["street"] = street.toString();
              request.fields["area"] = area.toString();
              request.fields["landmark"] = landmark.toString();
              request.fields["property_name"] = propertyName.toString();
              request.fields["property_type"] = propertyType.toString();
              request.fields["area_size"] = areaSize.toString();
              request.fields["building_type"] = buildingType.toString();
              request.fields["building_purpose"] = buildingPurpose.toString();
              request.fields["category"] = category.toString();
              request.fields["area_class"] = areaClass.toString();
              request.fields["lga"] = lga.toString();
              request.fields["zone"] = zone.toString();
              request.fields["agent_id"] = userId.toString();
              request.fields["mac_address"] = macAddress.toString();
              request.fields["latitude"] = latitude.toString();
              request.fields["longitude"] = longitude.toString();
              request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
              //send to the api
              var res = await request.send();

              //response from the api
              final response = await http.Response.fromStream(res);

              print(response.body);
            
      }
/***************************************************************************************************** */ 
/*******************************************INSERT PROPERTY INTO DATABASE********************************************************** */  
   static Future<String> sendData (
             title,firstName,middleName,lastName,gender,email, 
             phoneNumber,occupation,propertyId,houseNumber,street,area, 
             propertyName,areaSize,category,areaClass,landmark,longitude , 
             latitude,  imageFile, propertyType, zone, 
             lga, buildingPurpose, buildingType, userId, dbconnect,_isInternetAccess,macAddress)async {
              
              //getting the base name of the imageFile
              String imageName = basename(imageFile.path);

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
                        "sendStatus" : "awaiing"
                 };   
                 //check if property id exist before
                 //if exist dont save to the db
                  bool response= await checkPropertyId(propertyId,dbconnect);
                  if(response){
                    return "Property Exist";
                  }else{
                          //save the property to local db first 
                         await dbconnect.insert("enumeration", map);

                         //after saved is complete then send to the api if there is internet else return 
                         //property saved
                        switch (_isInternetAccess) {
                          case true:
                          var response=sendPropertyToApi(
                                    title,firstName,middleName,lastName,gender,email, 
                                    phoneNumber,occupation,propertyId,houseNumber,street,area, 
                                    propertyName,areaSize,category,areaClass,landmark,longitude , 
                                    latitude,  imageFile, propertyType, zone, 
                                    lga, buildingPurpose, buildingType, userId,macAddress);
                                  
                            break;
                          default:
                        }
                     return "Property saved";


                  }
    
             }
/***************************************************************************************************** */

}
 

 


