class Timer{
final String enddate;
final String title;
final String expiredtext;

  const Timer({this.enddate,this.title,this.expiredtext});





}

class Timers{

  static final List<Timer> timers = [
    const Timer(
      enddate: "2019-01-24 11:23:30",
      title: "ANNEN",
      expiredtext: "helal",
    ),
    const Timer(
      enddate: "2019-02-14 10:10:30",
      title: "NEDEN",
      expiredtext: "helal",
    ),
    const Timer(
      enddate: "2019-04-24 11:23:30",
      title: "MOLOTOFUMU KIM IÇTI",
      expiredtext: "helal",
    ),
    const Timer(
      enddate: "2019-02-01 11:23:30",
      title: "COCUK ADAM?",
      expiredtext: "helal",
    ),

  ];
}