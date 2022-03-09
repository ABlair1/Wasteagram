import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  const PopButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }
}