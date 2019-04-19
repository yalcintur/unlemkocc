import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DergiHttp{




  static void PutLike(var value,var id){
  var uri = "http://31.186.23.166/dergiler/like/$value/$id";
  http.put(Uri.encodeFull(uri), headers: { "Content-Type" : "application/x-www-form-urlencoded"}).then((result) {
  print(result.statusCode);
  print(result.body);
  });}
  static void PutDisLike(var value,var id){
    var uri = "http://31.186.23.166/dergiler/dislike/$value/$id";
    http.put(Uri.encodeFull(uri), headers: { "Content-Type" : "application/x-www-form-urlencoded"}).then((result) {
      print(result.statusCode);
      print(result.body);
    });}

}