import '../Model/dergis.dart';

class mapp {
  List<int> findremainder(int number) {
    if (number % 2 == 1) {
      List<int> arg = [number ~/ 2, 0];
      return arg;
    } else
      return [11, 1];
  }

  List<int> pickfirst() {
    int listlenght= DergiDao.dergis.length;
    if (findremainder(listlenght) == 1) {
      List<int> grow;

      for (var i = 0; i <listlenght ; i+2) {
        grow.add(i);
      }
    }
  }
}
