import 'package:flutter/material.dart';
import 'package:wasteagram/components/pop_button.dart';

class NewPostScreen extends StatelessWidget {

  final title = 'New Post';

  const NewPostScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: const PopButton(),
      ),
    );
  }
}