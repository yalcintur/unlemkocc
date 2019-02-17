import 'dart:convert';
import 'dart:async';
class Detail {
  final String id;
  final String title;
  final String link;



  const Detail({this.id, this.title, this.link});

  factory Detail.fromJson(Map<String, dynamic> parsedJson) {
    return Detail(
      id: parsedJson['_id'] as String,
      title: parsedJson['info'] as String,
      link: parsedJson['link'] as String,

    );
  }
}