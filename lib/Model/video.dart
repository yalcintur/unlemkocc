class Video{
  final String title;
  final String id;
  final String desc;
  final String link;
  final String bitimg;
  final String konimg;
  final String konname;
  final String expdate;



  const Video({this.id, this.title,this.desc, this.link,this.bitimg,this.konimg,this.konname,this.expdate});



  factory Video.fromJson(Map<String, dynamic> json) {



    //print(list.runtimeType); //returns List<dynamic>
    // print(imagesList);

    return Video(
      id: json['id'] as String,
      title: json['name'] as String,
      desc: json['info'] as String,
      link: json['link'] as String,
      bitimg:  json['imglink'] as String,
      konname:  json['konukname'] as String,
      konimg:  json['konukimg'] as String,
      expdate: json['expireDate'] as String,


    );
  }

}