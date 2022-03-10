import 'package:flutter/material.dart';
import 'package:wasteagram/components/post_list.dart';
import 'package:wasteagram/screens/new_post_screen.dart';

class PostListScreen extends StatelessWidget {

  static const routeName = 'postList';
  final title = 'Wasteagram';

  const PostListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: const PostList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.photo_camera),
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => NewPostScreen()
            )
          );
        }
        // onPressed: () => Navigator.of(context).pushNamed(NewPostScreen.routeName),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}