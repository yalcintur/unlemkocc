import './detailBar.dart';

class DetailBars {
  static final List<Detail> dergis = [
    const Detail(
      id: "1",
      title: "Boyut",
      link: "https://www.brookfield.hants.sch.uk/subpage-content/content-pdfs/exams11/English/Modern%20Text/An%20Inspector%20Calls_text.pdf",
    ),
    const Detail(
      id: "2",
      title: "EKİM 25 SAYISI",
      link: "https://www.brookfield.hants.sch.uk/subpage-content/content-pdfs/exams11/English/Modern%20Text/An%20Inspector%20Calls_text.pdf",
    ),
    const Detail(
      id: "3",
      title: "Boyut 48 ekim ",
      link: "assets/tawa@3x.png",
    ),
    const Detail(
      id: "4",
      title: "annen",
      link: "assets/tawa@3x.png",
    ),
  ];


  static List<Detail> callback(){

    return dergis;

  }




}
