import 'package:flutter/material.dart';

BoxDecoration backgroundBoxDecoration(String asset, {
  BoxFit boxFit =  BoxFit.cover,
  Alignment alignment = Alignment.topCenter,
  Color color = Colors.white,
}) {
  return BoxDecoration(
    color: color,
    image: DecorationImage(
      image: AssetImage(asset),
      fit: boxFit,
      alignment: alignment,
    ),
  );
}