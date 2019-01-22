import 'package:flutter/material.dart';
import '../Pages/ropor.dart';
import '../Theme.dart' as Theme;
import 'dart:async';

class RopComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class RopSayac extends StatefulWidget {
  RopoState parent;
  RopSayac(this.parent);
  _RopSayacState createState() => new _RopSayacState(parent);
}

class _RopSayacState extends State<RopSayac> {
  RopoState parent;
  _RopSayacState(this.parent);
  int remday = 0, remhour = 0, remmin = 0, remsec = 0;
  bool expired = false;
  var _now = DateTime.now();
  var endpoint = DateTime.parse("2019-01-24 11:23:30");

  Timer _everySecond;
  final Ropo ropo = new Ropo();

  @override
  void dispose() {
    super.dispose();
    _everySecond.cancel();
  }

  Widget sayac(
    BuildContext context,
  ) {
    return Container(
      color: Colors.black,
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      child: new Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: new Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "BU HAFTAKİ RÖPORTAJA",
              style: Theme.TextStyles.ropsayacc,
            ),
            new Expanded(
              flex: 1,
              child: new Container(
                color: Colors.black,
              ),
            ),
            new Text(
              "$remday : $remhour : $remmin : $remsec",
              style: Theme.TextStyles.ropsayaccint,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //  RopoState bilge = new RopoState();

    // eğer videonun çıkacağı tarihten öndeysek
    //sayacı başlat
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (_now.isBefore(endpoint) == true ||
          _now.difference(endpoint).inSeconds == 0) {
        //     bilge.updateexpired(false);
        expired = false;
        if (this.parent.mounted) {
          this.parent.setState(() {
            this.parent.expired = false;
          });
        }

        //    debugPrint(_now.toString());

        _now = DateTime.now();
        var remai = endpoint.difference(_now);

        ///   bilge.updatetimer(int.parse(remai.inDays.toString()), int.parse(remai.inHours.toString()) % 24, int.parse(remai.inMinutes.toString()) % 60, int.parse(remai.inSeconds.toString()) % 60);

        if (this.mounted) {
          setState(() {
            _now = DateTime.now();
            var remai = endpoint.difference(_now);
            remday = int.parse(remai.inDays.toString());
            remhour = int.parse(remai.inHours.toString()) % 24;
            remmin = int.parse(remai.inMinutes.toString()) % 60;
            remsec = int.parse(remai.inSeconds.toString()) % 60;
          });
        }
      } else {
        debugPrint("expired");
        if (this.parent.mounted) {
          this.parent.setState(() {
            this.parent.expired = true;
          });
        }

        //  bilge.updateexpired(false);
      }
    });
  }

  // defines a timer

  @override
  Widget build(BuildContext context) {
    return Container(
      child: sayac(context),
    );
  }
}
