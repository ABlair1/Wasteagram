import 'package:flutter/material.dart';

class WasteQuantity extends StatelessWidget {

  final int quantity;

  const WasteQuantity({ Key? key, required this.quantity }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      quantity.toString(),
      style: Theme.of(context).textTheme.headline3,
    );
  }
}