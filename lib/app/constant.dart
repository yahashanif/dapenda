import 'package:flutter/material.dart';

double designHeightPhone = 844;
double designWidthPhone = 390;

double defaultMargin = 24;

double getActualX({
  required double x,
  required BuildContext context,
}) {
  return x / designWidthPhone * MediaQuery.of(context).size.width;
}

double getActualY({
  required double y,
  required BuildContext context,
}) {
  return y / designHeightPhone * MediaQuery.of(context).size.height;
}
