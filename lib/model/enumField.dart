
// ignore_for_file: non_constant_identifier_names, camel_case_types, file_names, unused_local_variable, prefer_typing_uninitialized_variables, prefer_function_declarations_over_variables

import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:get_mac/get_mac.dart';
class enumField {

    static  TextEditingController   title_Controller             = TextEditingController();
    static  TextEditingController   firstName_Controller         = TextEditingController();
    static  TextEditingController   middleName_Controller        = TextEditingController();
    static  TextEditingController   lastName_Controller          = TextEditingController();
    static  TextEditingController   gender_Controller            = TextEditingController();
    static  TextEditingController   email_Controller             = TextEditingController();
    static  TextEditingController   phoneNumber_Controller       = TextEditingController();
    static  TextEditingController   occupation_Controller        = TextEditingController();
    static  TextEditingController   propertyId_Controller        = TextEditingController();
    static  TextEditingController   housenumber_Controller       = TextEditingController();
    static  TextEditingController   street_Controller            = TextEditingController();
    static  TextEditingController   area_Controller              = TextEditingController();
    static  TextEditingController   propertyName_Controller      = TextEditingController();
    static  TextEditingController   areaSize_Controller          = TextEditingController();
    static  TextEditingController   category_Controller          = TextEditingController();
    static  TextEditingController   areaClass_Controller         = TextEditingController();
    static  TextEditingController   landmark_Controller          = TextEditingController();


     //property type value list
    static var PropertyTypeList= [
            	"Residential Building",
            	"Hotel",
            	"Schools",
            	"Petrol Stations",
            	"Telecom base stations",
            	"Power substations",
            	"Banks",
            	"Microfinance banks",
            	"Finance houses",
            	"Insurance companies",
            	"Industrial Properties",
            	"Hospitals",
            	"Office Complex/Business Premises",
    ];
    //LGA LIST
     static var getLga= [
            "Ado Ekiti",
            "Ikere Ekiti",
            "Ekiti East"
            "Ekiti South West",
            "Ekiti West",
            "Ido/Osi",
            "Irepodun/Ifelodun",
            "Oye",
            "Ikole",
            "Ijero",
            "Moba",
            "Ise/Orun",
            "Ilejemeje",
            "Gboyin",
            "Emure",
    ];
    //BUILDING PURPOSE LIST

/***************************** Building Type starts here********************************************************************* */

         static List<String>getBuildingType(PropertyType_Selected){
     List<String> BuildingType;
              switch (PropertyType_Selected) {
                case "Residential Building":{   //residential
                      return BuildingType= [
                        "Bungalow ",
                        "Duplex",
                        "Face me I face You",	 
                   ];
                }
                  break;
                case "Hotel":{       //hotel
                      return BuildingType= [];
                     
                }
                  break;
                case "Office Complex/Business Premises":{   // office complex
                      return BuildingType= [];
                }
                 break;
               case "Schools":{   //schools
                      return BuildingType= [];
                }

                default : {
                    return BuildingType= [];
                }
              } //end of switch
     
      }
/***************************** Building Type ends here********************************************************************* */

/***************************** Building Purpose starts here********************************************************************* */

         static List<String>getBuildingPurpose(PropertyType_Selected){
           List<String> BuildingPurpose;
              switch (PropertyType_Selected) {
                case "Residential Building":{   //residential
                      return BuildingPurpose= [
                        "Fully Business ",
                        "Mixed",
                        "Owner Occupier",	 
                   ];
                }
                  break;

                case "Hotel":{       //hotel
                      return BuildingPurpose= ["Business"]; 
                }
                  break;
                case "Office Complex/Business Premises":{   // office complex
                      return BuildingPurpose= ["Business"];
                }
                 break;
               case "Schools":{   //schools
                      return BuildingPurpose= [
                        "Private Secondary School (A)",
                        "Private Secondary School (B)",
                        "Private Primary School (A)",
                        "Private Primary School (B)",
                      ];
                }

                default : {
                    return BuildingPurpose= ["Business"];
                }
              } //end of switch
     
      }
/***************************** Building Purpose ends here********************************************************************* */
/***************************** Zone starts here********************************************************************* */

         static List<String>getZone(PropertyType_Selected){
           List<String> Zone;
              switch (PropertyType_Selected) {
                case "Residential Building":{   //residential
                      return Zone= [
                        "HVZ",
                        "MVZ",
                        "LVZ",	 
                   ];
                }
                  break;

                case "Hotel":{       //hotel
                      return Zone= [
                        "HVZ",
                        "MVZ",
                        "LVZ",
                      ]; 
                }
                  break;
                case "Office Complex/Business Premises":{   // office complex
                      return Zone= [
                        "HVZ",
                        "MVZ",
                        "LVZ",
                      ];
                }
                 break;
               case "Schools":{   //schools
                      return Zone= [
                        "EDU"
                      ];
                }

                default : {
                    return Zone= ["ENC"];
                }
              } //end of switch
     
      }
/***************************** Zone ends here********************************************************************* */


}
     //these variables are used in enumeration.dart dropdownButton
      var longitude_Controller="";
      var latitude_Controller="";
      var  PropertyType_selectedValue;
      var  Zone_selectedValue;
      var  Lga_selectedValue;
      var  BuildingPurpose_selectedValue;
      var  BuildingType_selectedValue;
      var  images;
      var  image;
      var  userId;
      File? image_Controller;

