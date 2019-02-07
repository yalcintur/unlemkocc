import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './bottomtab.dart';


class Webview extends StatelessWidget {
  String url;
  Webview(this.url);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: Bottomtab.AppBarr(),
    );
  }
}
