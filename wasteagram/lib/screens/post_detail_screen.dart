import 'package:flutter/material.dart';
import 'package:wasteagram/components/pop_button.dart';

class PostDetailScreen extends StatelessWidget {

  static const routeName = 'postDetail';
  final title = 'Wasteagram';

  const PostDetailScreen({ Key? key }) : super(key: key);

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