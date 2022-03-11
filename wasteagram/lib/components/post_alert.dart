import 'package:flutter/material.dart';

void postAlert(BuildContext context, String heading, String message) {
  showDialog(
    context: context, 
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(heading),
        content: Text(message),
      );
    }
  );
}