import './dergi.dart';
class DergiDao {

  static final List<Dergi> dergis = [
    const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/tawa@3x.png",
      like: "123",
      seen: "240",
     
    ),
     const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/dive@3x.png",
      like: "15",
      seen: "43",
     
    ),
     const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/boyutkapak@3x.png",
      like: "12",
      seen: "34",
     
    ),
    const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/tawa@3x.png",
      like: "123",
      seen: "240",
     
    ),
     const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/dive@3x.png",
      like: "15",
      seen: "43",
     
    ),
     const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/boyutkapak@3x.png",
      like: "12",
      seen: "34",
     
    ),
    const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/tawa@3x.png",
      like: "123",
      seen: "240",
     
    ),
     const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/dive@3x.png",
      like: "15",
      seen: "43",
     
    ),
     const Dergi(
      id: "1",
      name: "Boyut",
      image: "assets/boyutkapak@3x.png",
      like: "12",
      seen: "34",
     
    ),
  ];

  static Dergi getPlanetById(id) {
    return dergis
        .where((p) => p.id == id)
        .first;
  }
}