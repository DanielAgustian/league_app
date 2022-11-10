import 'dart:ui' as ui;

import 'package:get/get.dart';

double? responsive(double size1000, double sizeTablet, double sizeBigPhone,
    double sizeSmallPhone) {
  double screenWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;

  if (screenWidth > 1000) {
    return size1000;
  } else if (screenWidth > 768) {
    return sizeTablet;
  } else if (screenWidth > 450) {
    return sizeBigPhone;
  } else {
    return sizeSmallPhone;
  }
}
