import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import '../Model/dergis.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DergiHttp{



  static Future updateStatus() async{
    var val = await DergiDao.dergicallback();
  }

  static Future setbool(var kiy,var id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("$id $kiy", true);

  }

  static void PutLike(var value,var id){
  var uri = "http://31.186.23.166/dergiler/like/$value/$id";
  http.put(Uri.encodeFull(uri), headers: { "Content-Type" : "application/x-www-form-urlencoded"}).then((result) {
    setbool("lk",id);
  print(result.statusCode);
  print(result.body);
  });

  updateStatus();
  }
  static void PutDisLike(var value,var id){
    var uri = "http://31.186.23.166/dergiler/dislike/$value/$id";
    http.put(Uri.encodeFull(uri), headers: { "Content-Type" : "application/x-www-form-urlencoded"}).then((result) {
      setbool("dlk",id);
      print(result.statusCode);
      print(result.body);
    });
    updateStatus();
  }

}
class LoginHttp{


  static Future<dynamic> RegisterEmail(var email) async{

    
    var a = email.toString().split("@").toList();

   try{ if(a[1] == "koc.k12.tr"|| a[1] == "stu.kocschool.k12.tr"){
      final response =
      await http.get('http://31.186.23.166/register/$email');
      //print(response);
      var ram =
         json.decode(response.body);
      assert(ram is Map);
      if(ram['code'] == 11000){
        return 11000;

      }else return 200;
      //return response;
    }else {
    print(a[1]);
    return "unvalid";

   }}catch(e){
     return "unvalide";
   }


  }

  static Future<int> QueryData(var email,var passw) async{
    final response =
      await http.get('http://31.186.23.166/login/$email/$passw');
    print('Response body: ${response.body}');
    return int.parse(response.body.toString());
  }










}