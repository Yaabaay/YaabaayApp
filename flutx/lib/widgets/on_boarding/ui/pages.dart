/*
* File : Pages
* Version : 1.0.0
* */

import 'package:flutter/material.dart';

class FxSinglePage extends StatelessWidget {
  final PageViewModel? viewModel;
  final double? percentVisible;
  final Decoration? decoration;

  FxSinglePage({
    this.viewModel,
    this.decoration,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        //color: viewModel!.color,
        decoration: viewModel?.decoration,
        child: Opacity(
          opacity: percentVisible!,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, 50.0 * (1.0 - percentVisible!), 0.0),
                  child: viewModel!.content
                ),
              ]),
        ));
  }
}

class PageViewModel {
  //final Color? color;
  final Widget content;
  final Decoration decoration;


  PageViewModel(
    //this.color,
    this.decoration,
    this.content,
  );
}
