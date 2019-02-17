import './detailBar.dart';
class Dergi {
  final int id;
  final String name;
  final String pdf;
 final String image;
//  final String seen;
  final String info;
  final List<Detail> linkler;


  const Dergi({this.id, this.name, this.pdf,
    this.info,this.image,this.linkler});



  factory Dergi.fromJson(Map<String, dynamic> json) {


    var list = json['linkler'] as List;
    //print(list.runtimeType); //returns List<dynamic>
    List<Detail> imagesList = list.map((i) => Detail.fromJson(i)).toList();
   // print(imagesList);

    return Dergi(
      id: json['id'] as int,
      name: json['name'] as String,
      pdf: json['pdf'] as String,
      info: json['info'] as String,
      image: json['img'] as String,
      linkler: imagesList,
    );
  }


}