import 'package:flutter/material.dart';
import 'package:wasteagram/components/post_list.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'package:image_picker/image_picker.dart';

class PostListScreen extends StatelessWidget {

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
        onPressed: () async {
          XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
          if (image != null) {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => NewPostScreen(image: image)
              )
            );
          }
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}