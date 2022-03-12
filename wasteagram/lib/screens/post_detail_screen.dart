import 'package:flutter/material.dart';
import 'package:wasteagram/components/pop_button.dart';
import 'package:wasteagram/components/post_detail.dart';
import 'package:wasteagram/models/post_data.dart';

class PostDetailScreen extends StatelessWidget {

  final title = 'Wasteagram';
  final PostData postData;
  final backButtonHint = 'Go back to the post list screen';

  const PostDetailScreen({ Key? key, required this.postData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: Semantics(
          button: true,
          enabled: true,
          onTapHint: backButtonHint,
          child: const PopButton(),
        ),
      ),
      body: PostDetail(postData: postData),
    );
  }
}