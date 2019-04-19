
import 'package:flutter/material.dart';


class RopoClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height-(size.height/10));
    var firstcontrol = new Offset(size.width/2, size.height);
    var firstend = new Offset(size.width,size.height-(size.height/10));
    path.quadraticBezierTo(firstcontrol.dx,firstcontrol.dy, firstend.dx, firstend.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;


}