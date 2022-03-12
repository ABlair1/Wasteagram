import 'package:flutter/material.dart';

const alertDialogHint = 'Tap elsewhere on screen to close alert message';

void postAlert(BuildContext context, String heading, String message) {
  showDialog(
    context: context, 
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Semantics(
        hint: alertDialogHint,
        child: AlertDialog(
          title: Text(heading),
          content: Text(message),
        ),
      );
    }
  );
}