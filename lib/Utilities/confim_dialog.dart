import 'package:app/Resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertDialog(BuildContext context, {String? title, String? alertText, String? confirmButtonText,  VoidCallback? okCallback }) {
  // set up the button
  Widget okButton = Container(
    padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 15),
    child: InkWell(
      onTap: okCallback ?? () { Get.back(); },
      child: Text(confirmButtonText ?? AT1Strings.ok.tr, style: const TextStyle(fontSize: 18)),
    ),
  );
  Widget cancelButton = Container(
    padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 15),
    child: InkWell(
      onTap: () => Get.back(),
      child: Text(AT1Strings.dismiss.tr, style: TextStyle(fontSize: 18, color: Colors.red)),
    ),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title ?? AT1Strings.alert.tr),
    content: Text(alertText ?? AT1Strings.confirm.tr),
    actions: [
      cancelButton,
      const SizedBox(width: 20,),
      okButton
    ],
    actionsAlignment: MainAxisAlignment.spaceAround,
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}