import 'package:flutter/material.dart';
import 'package:wasteagram/components/pop_button.dart';
import 'package:wasteagram/components/post_detail.dart';
import 'package:wasteagram/models/post_data.dart';

class PostDetailScreen extends StatelessWidget {

  final title = 'Wasteagram';
  final PostData postData;

  const PostDetailScreen({ Key? key, required this.postData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: const PopButton(),
      ),
      body: PostDetail(postData: postData),
    );
  }
}