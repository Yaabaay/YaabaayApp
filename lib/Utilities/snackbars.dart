import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';

class Snackbars {
  static const _duration = Duration(seconds: 3);

  static const _margin = 8.0;
  static const _borderRadius = 8.0;

  static success(String message) {
    Get.snackbar(
      AT1Strings.successTitle.tr,
      message,
      colorText: Colors.white,
      titleText: _buildTitle(AT1Strings.successTitle),
      messageText: _buildBody(message),
      duration: _duration,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorsFactory.success,
      margin: const EdgeInsets.all(_margin),
      borderRadius: _borderRadius,
    );
  }

  static danger(String error) {
    Get.snackbar(
      AT1Strings.errorTitle.tr,
      _parseError(error).toString(),
      colorText: Colors.white,
      titleText: _buildTitle(AT1Strings.errorTitle),
      messageText: _buildBody(_parseError(error)),
      duration: _duration,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorsFactory.danger,
      margin: const EdgeInsets.all(_margin),
      borderRadius: _borderRadius,
    );
  }

  static Widget _buildTitle(String title) {
    return TextFactory.buildNormalText3(
      title,
      weight: FontWeights.medium,
      color: ColorsFactory.secondary,
    );
  }

  static Widget _buildBody(String? body) {
    return TextFactory.buildNormalText3(
      '$body',
      color: ColorsFactory.secondary,
    );
  }

  static _parseError(String message) {
    try {
      final obj = json.decode(message);
      if (obj.containsKey('message') && obj['message'] != null) {
        return obj['message'];
      }
      return message;
    } catch (error) {
      return message;
    }
  }
}
