import 'package:flutter/material.dart';

Widget TransformWithDirection(BuildContext context, Widget widget){
  return Transform.scale(
    scaleX: Directionality.of(context) == TextDirection.rtl ? -1 : 1,
    child: widget,
  );
}

TextDirection getCurrentTextDirection(BuildContext context){
  return Directionality.of(context) == TextDirection.rtl ? TextDirection.rtl : TextDirection.ltr;
}