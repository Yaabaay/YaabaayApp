import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_factory.dart';
import '/Resources/translations.dart';

class TextFactory {
  static const title1Size = 25.0;
  static const title2Size = 20.0;
  static const normalText1Size = 18.0;
  static const normalText2Size = 16.0;
  static const normalText3Size = 14.0;
  static const normalText4Size = 12.0;
  static const normalText5Size = 10.0;

  static Text _buildText(
    String text,
    double size,
    FontWeight weight,
    Color color, {
    TextDirection? direction,
    TextAlign? align,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
    List<String> args = const [],
  }) {
    final style = buildStyle(size: size, weight: weight, color: color, decoration: decoration);
    return Text(
      text.trArgs(args),
      style: style,
      textDirection: direction,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  static TextStyle buildStyle({
    double size = normalText3Size,
    FontWeight weight = FontWeights.regular,
    Color color = ColorsFactory.text,
    TextDecoration? decoration,
  }) {
    if (_checkIfArabic()) {
      return GoogleFonts.cairo(
        fontSize: size,
        fontWeight: weight,
        color: color,
        decoration: decoration,
      );
    }
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color,
      decoration: decoration,
    );
  }

  static Text buildTitle1(
    String text, {
    FontWeight weight = FontWeights.regular,
    Color color = ColorsFactory.text,
    TextAlign align = TextAlign.start,
    List<String> args = const [],
    TextDirection? direction,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
  }) {
    return _buildText(
      text,
      title1Size,
      weight,
      color,
      align: align,
      direction: direction,
      overflow: overflow,
      decoration: decoration,
      maxLines: maxLines,
      args: args,
    );
  }

  static Text buildTitle2(
    String text, {
    FontWeight weight = FontWeights.regular,
    Color color = ColorsFactory.text,
    TextAlign align = TextAlign.start,
    List<String> args = const [],
    TextDirection? direction,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
  }) {
    return _buildText(
      text,
      title2Size,
      weight,
      color,
      align: align,
      direction: direction,
      overflow: overflow,
      decoration: decoration,
      maxLines: maxLines,
      args: args,
    );
  }

  static Text buildNormalText1(
    String text, {
    FontWeight weight = FontWeights.regular,
    Color color = ColorsFactory.text,
    TextAlign align = TextAlign.start,
    List<String> args = const [],
    TextDirection? direction,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
  }) {
    return _buildText(
      text,
      normalText1Size,
      weight,
      color,
      align: align,
      direction: direction,
      overflow: overflow,
      decoration: decoration,
      maxLines: maxLines,
      args: args,
    );
  }

  static Text buildNormalText2(
    String text, {
    FontWeight weight = FontWeights.regular,
    Color color = ColorsFactory.text,
    TextAlign align = TextAlign.start,
    List<String> args = const [],
    TextDirection? direction,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
  }) {
    return _buildText(
      text,
      normalText2Size,
      weight,
      color,
      align: align,
      direction: direction,
      overflow: overflow,
      decoration: decoration,
      maxLines: maxLines,
      args: args,
    );
  }

  static Text buildNormalText3(
    String text, {
    FontWeight weight = FontWeights.regular,
    Color color = ColorsFactory.text,
    TextAlign align = TextAlign.start,
    List<String> args = const [],
    TextDirection? direction,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
  }) {
    return _buildText(
      text,
      normalText3Size,
      weight,
      color,
      align: align,
      direction: direction,
      overflow: overflow,
      decoration: decoration,
      maxLines: maxLines,
      args: args,
    );
  }

  static Text buildNormalText4(
    String text, {
    FontWeight weight = FontWeights.regular,
    Color color = ColorsFactory.text,
    TextAlign align = TextAlign.start,
    List<String> args = const [],
    TextDirection? direction,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
  }) {
    return _buildText(
      text,
      normalText4Size,
      weight,
      color,
      align: align,
      direction: direction,
      overflow: overflow,
      decoration: decoration,
      maxLines: maxLines,
      args: args,
    );
  }

  static Text buildNormalText5(
    String text, {
    FontWeight weight = FontWeights.regular,
    Color color = ColorsFactory.text,
    TextAlign align = TextAlign.start,
    List<String> args = const [],
    TextDirection? direction,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
  }) {
    return _buildText(
      text,
      normalText5Size,
      weight,
      color,
      align: align,
      direction: direction,
      overflow: overflow,
      decoration: decoration,
      maxLines: maxLines,
      args: args,
    );
  }

  static bool _checkIfArabic() {
    if (Get.locale?.languageCode ==
        AT1Translations.supportedLanguages.last.locale.languageCode) {
      return true;
    }
    return false;
  }
}

class FontWeights {
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w900;
}
