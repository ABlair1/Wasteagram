import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WasteDate extends StatelessWidget {

  final DateTime date;

  const WasteDate({ Key? key, required this.date }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMMEEEEd().format(date),
      style: Theme.of(context).textTheme.headline6,
    );
  }
}