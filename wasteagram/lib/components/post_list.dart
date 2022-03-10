import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/screens/post_detail_screen.dart';
import 'package:intl/intl.dart';

class PostList extends StatefulWidget {
  const PostList({ Key? key }) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var post = snapshot.data!.docs[index];
              return ListTile(
                contentPadding: const EdgeInsets.all(15),
                title: Text(
                  DateFormat.yMMMMEEEEd().format(post['date'].toDate()),
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: Text(
                  post['quantity'].toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context, 
                    PostDetailScreen.routeName,
                  );
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong...'),);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}