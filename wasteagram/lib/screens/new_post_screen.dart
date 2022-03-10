import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasteagram/components/pop_button.dart';
import 'package:image_picker/image_picker.dart';

class NewPostScreen extends StatelessWidget {

  final title = 'New Post';
  final XFile? image;

  const NewPostScreen({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: const PopButton(),
      ),
      body: Center(child: Image.file(File(image!.path)),),
    );
  }
}