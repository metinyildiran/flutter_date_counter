import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../util/constants.dart';
import '../util/preference_utils.dart';

class CustomAlertDialog extends StatelessWidget {
  GestureTapCallback onNegativeButtonPressed;
  GestureTapCallback onPositiveButtonPressed;
  String title;
  String text;
  String negativeButtonText;
  String positiveButtonText;

  CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.text,
      required this.negativeButtonText,
      required this.positiveButtonText,
      required this.onNegativeButtonPressed,
      required this.onPositiveButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(child: Text(text)),
      actions: <Widget>[
        TextButton(
          child: Text(negativeButtonText),
          onPressed: onNegativeButtonPressed,
        ),
        ElevatedButton(
          child: Text(positiveButtonText),
          onPressed: onPositiveButtonPressed,
        )
      ],
    );
  }
}
