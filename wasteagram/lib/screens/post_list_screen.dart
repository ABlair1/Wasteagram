import 'dart:core';
import 'package:flutter/material.dart';
import 'package:wasteagram/components/post_list.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({ Key? key }) : super(key: key);

  @override
  State<PostListScreen> createState() => PostListScreenState();
}

class PostListScreenState extends State<PostListScreen> {

  final title = 'Wasteagram';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              int totalWaste = 0;
              snapshot.data!.docs.forEach((post) {
                totalWaste += int.parse(post['quantity'].toString());
              });
              return Text('$title - $totalWaste');
            } else {
              return Text(title);
            }
          },
        ),
        // title: Text(title),
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


// class PostListScreen extends StatelessWidget {

//   final title = 'Wasteagram';

//   const PostListScreen({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         centerTitle: true,
//       ),
//       body: const PostList(),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.photo_camera),
//         onPressed: () async {
//           XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
//           if (image != null) {
//             Navigator.push(
//               context, 
//               MaterialPageRoute(
//                 builder: (context) => NewPostScreen(image: image)
//               )
//             );
//           }
//         }
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }