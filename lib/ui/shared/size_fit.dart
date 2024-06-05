import 'package:flutter/material.dart';

class HYSizeFit{
  static late MediaQueryData _mediaQuery;
  static late double screenWidth;
  static late double screenHeight;
  static late double rpx;
  static late double px;

  static init(BuildContext context,{double standardWidth=750}){

    _mediaQuery = MediaQuery.of(context);
    screenWidth = _mediaQuery.size.width;
    screenHeight = _mediaQuery.size.height;
    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;
  }


  static double setPx(double value) {
    return HYSizeFit.px*value;
  }
  static double setRpx(double value) {
    return HYSizeFit.rpx*value;
  }
}