import 'package:flutter/cupertino.dart';

class THeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    final firstPoint=Offset(30, size.height-20);
    final firstController=Offset(0, size.height-20);

    path.quadraticBezierTo(firstController.dx, firstController.dy, firstPoint.dx, firstPoint.dy);

    path.lineTo(size.width-30, size.height-20);

    final secondPoint=Offset(size.width, size.height);


    final secondController=Offset(size.width,size.height-20);

    path.quadraticBezierTo(secondController.dx, secondController.dy, secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}