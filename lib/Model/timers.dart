class Timer{
final String enddate;
final String title;
final String expiredtext;

  const Timer({this.enddate,this.title,this.expiredtext});

}

class Timers{

  static final List<Timer> timers = [
    const Timer(
      enddate: "2019-04-19 11:23:30",
      title: "Sevgi Gönül",
      expiredtext: "helal",
    ),
    const Timer(
      enddate: "2019-05-11 10:10:30",
      title: "Okulların Kapanması",
      expiredtext: "helal",
    ),
    const Timer(
      enddate: "2019-04-24 11:23:30",
      title: "STFU YOU MOTHER SHİT..............",
      expiredtext: "helal",
    ),
    const Timer(
      enddate: "2019-02-01 11:23:30",
      title: "Common Exams",
      expiredtext: "Sınavlar Başladı!!",
    ),

  ];
}