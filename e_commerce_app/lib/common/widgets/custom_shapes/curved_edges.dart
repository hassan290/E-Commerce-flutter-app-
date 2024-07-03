import 'package:flutter/cupertino.dart';

class TCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    
    final firstController=Offset(0, size.height-20);
    final firstPoint=Offset(30, size.height-20);
    path.quadraticBezierTo(firstController.dx, firstController.dy, firstPoint.dx, firstPoint.dy);

    final secondPoint=Offset(size.width-20,size.height-20);
    path.lineTo(secondPoint.dx, secondPoint.dy);

    final thirdPoint=Offset(size.width, size.height);
    final secondController=Offset(size.width, size.height-20);
    path.quadraticBezierTo(secondController.dx, secondController.dy, thirdPoint.dx, thirdPoint.dy);
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}