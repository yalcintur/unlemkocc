class Dergi {
  final String id;
  final String name;
  final String image;
//  final String like;
//  final String seen;
  final String info;


  const Dergi({this.id, this.name, this.image,
    this.info,});


  factory Dergi.fromJson(Map<String, dynamic> json) {
    return Dergi(
      id: json['_id'],
      name: json['name'],
      image: "assets/tawa@3x.png",
      info: json['info'],

    );
  }

}