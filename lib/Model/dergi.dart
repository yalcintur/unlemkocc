class Dergi {
  final int id;
  final String name;
  final String pdf;
 final String image;
//  final String seen;
  final String info;


  const Dergi({this.id, this.name, this.pdf,
    this.info,this.image});



  factory Dergi.fromJson(Map<String, dynamic> json) {
    return Dergi(
      id: json['id'] as int,
      name: json['name'] as String,
      pdf: json['pdf'] as String,
      info: json['info'] as String,
      image: json['img'] as String,
    );
  }


}