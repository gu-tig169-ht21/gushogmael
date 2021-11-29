// ignore_for_file: file_names
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/model.dart';

const API_KEY = '8bebdecc-6397-4e9e-99a3-89a50bf4b4d3';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  


  //get
  static Future<List<CheckBoxState>> getList() async {
      var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
      var json = jsonDecode(response.body);
    return json.map<CheckBoxState>((data) {
      return CheckBoxState.fromJson(data);
    }).toList();

    }

     //delte
    static Future deleteBox(String checkboxId) async {
      var response = await http.delete(Uri.parse('$API_URL/todos/$checkboxId?key=$API_KEY'));
      var bodyString = response.body;
      var list = jsonDecode(bodyString);

      return list.map<CheckBoxState>((data) {
      return CheckBoxState.fromJson(data);
    }).toList();

        }

      //update
    /*static Future setDoneCheckList(CheckBoxState checkbox, checkboxId) async {
      var json = checkbox.toJson();
      var bodyString = jsonEncode(json);
      var response = await http.put(Uri.parse('$API_URL/todos/$checkboxId?key=$API_KEY'),
      body: bodyString, 
      headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return response;
      }else {
        return null;
      }
    }*/
    static Future<List<CheckBoxState>> changeCheckList(CheckBoxState checkbox, checkboxId) async {
    Map<String, dynamic > json = CheckBoxState.toJson(checkbox);
    var bodyString = jsonEncode(json);
    var response = await http.put(Uri.parse('$API_URL/todos/$checkboxId?key=$API_KEY'),
     body: bodyString,
     headers: {'Content-Type': 'application/json'},
     );
     bodyString = response.body;
      var list = jsonDecode(bodyString);
      return list.map<CheckBoxState>((data){
        return CheckBoxState.fromJson(data);
      }).toList();
      }



    //post 
    static Future<List<CheckBoxState>> addCheckBox(CheckBoxState checkbox) async {
      Map<String, dynamic> json = CheckBoxState.toJson(checkbox);
      var bodyString = jsonEncode(json);
      var response = await http.post(Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
      );
      bodyString = response.body;
      var list = jsonDecode(bodyString);

      return list.map<CheckBoxState>((data){
        return CheckBoxState.fromJson(data);
      }).toList();
      }
      

      }


    //post 
    /*static Future addBox(CheckBoxState checkbox) async {
    try{
     var json = checkbox.toJson();
     var bodyString = jsonEncode(json);
     var response = await http.post(Uri.parse('$API_URL/todos?key=$API_KEY'),
     body: bodyString,
     headers: {'Content-Type': 'application/json'},
     );
     if (response.statusCode == 200) {
        return response;
      
      }else {
        return null;
        }

        } catch (e) {
       throw e;
      }
    }*/


      


     

    
     
   

   

    

/*static Future addBox(CheckBoxState checkbox) async{
  var json = checkbox.toJson(checkbox);
  var bodyString = jsonEncode(json);
  var response = await http.post(Uri.parse('$API_URL/todos?key=$API_KEY'),
  body: bodyString, headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    return response;
  } else {
    print('failed');
    return null;
  }
}*/

   
  


