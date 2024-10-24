import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(19, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, 38);
    path_0.lineTo(9.5, 26);
    path_0.lineTo(19, 38);
    path_0.lineTo(19, 0);
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    
    return true;
  }
}