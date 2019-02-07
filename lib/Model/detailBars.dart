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
      link: "https://drive.google.com/uc?export=download&id=1n7DOSPHJudPkIjkvJtNctfe-BfRMEmKf",
    ),
    const Detail(
      id: "3",
      title: "Boyut 48 ekim ",
      link: "https://drive.google.com/uc?export=download&id=1Ca5jFeruoVzb6E2xgwYbNqSA6PvBi0wW",
    ),
    const Detail(
      id: "4",
      title: "annen",
      link: "https://drive.google.com/uc?export=download&id=1wBwgSv6S5LgrR_693DfwJXuN6ii4p4UW",
    ),
  ];


  static List<Detail> callback(){

    return dergis;

  }




}
