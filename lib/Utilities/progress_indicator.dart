import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

class ProgressIndicators {
  static const _indicatorRadius = 17.5;
  static const _sideLength = 70.0;
  static const _borderRadius = 5.0;
  static const _colorOpacity = 0.7;

  static loadingIndicator() {
    if (Platform.isIOS) return _iosLoadingIndicator();
    return _androidLoadingIndicator();
  }

  static Widget _iosLoadingIndicator() {
    return const Center(
      child: CupertinoActivityIndicator(radius: _indicatorRadius),
    );
  }

  static Widget _androidLoadingIndicator() {
    return const Center(
      child: SizedBox(
        width: _indicatorRadius * 2,
        height: _indicatorRadius * 2,
        child: CircularProgressIndicator(),
      ),
    );
  }

  static loadingDialog() {
    if (Platform.isIOS) return Get.dialog(_iosLoadingDialogContent());
    return Get.dialog(_androidLoadingDialogContent());
  }

  static Widget _iosLoadingDialogContent() {
    return Center(
      child: Container(
        width: _sideLength,
        height: _sideLength,
        decoration: _buildiOSLoadingDialodDecoration(),
        child: _buildiOSLoadingDialodIndicator(),
      ),
    );
  }

  static BoxDecoration _buildiOSLoadingDialodDecoration() {
    return BoxDecoration(
      color: Colors.black.withOpacity(_colorOpacity),
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  static Widget _buildiOSLoadingDialodIndicator() {
    return Theme(
      data: ThemeData(
        cupertinoOverrideTheme: const CupertinoThemeData(
          brightness: Brightness.dark,
        ),
      ),
      child: const CupertinoActivityIndicator(radius: _indicatorRadius),
    );
  }

  static Widget _androidLoadingDialogContent() {
    return Center(
      child: Container(
        width: _sideLength,
        height: _sideLength,
        decoration: _buildAndroidLoadingDialodDecoration(),
        child: _buildAndroidLoadingDialodIndicator(),
      ),
    );
  }

  static BoxDecoration _buildAndroidLoadingDialodDecoration() {
    return BoxDecoration(
      color: Colors.black.withOpacity(_colorOpacity),
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  static Widget _buildAndroidLoadingDialodIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: _indicatorRadius * 2,
          height: _indicatorRadius * 2,
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
