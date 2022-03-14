import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/components/create_post_map.dart';
import 'package:wasteagram/components/waste_date.dart';
import 'package:wasteagram/components/waste_quantity.dart';
import 'package:wasteagram/models/post_data.dart';
import 'package:wasteagram/screens/post_detail_screen.dart';

class PostList extends StatefulWidget {

  final postTileLabel = 'Individual food waste post showing date and quantity of waste';
  final postTileTapHint = 'Tap on the post to view more details';
  final errorLabel = 'An error has occured';
  final listProgressIndicatorLabel = 'Indicates that the post list is loading or no posts exist';

  const PostList({ Key? key }) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var post = snapshot.data!.docs[index];
              return Semantics(
                enabled: true,
                label: widget.postTileLabel,
                onTapHint: widget.postTileTapHint,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(15),
                  title: WasteDate(date: post['date'].toDate()),
                  trailing: WasteQuantity(quantity: post['quantity']),
                  onTap: () {
                    var postMap = createPostMap(post);
                    var postData = PostData.fromCloudFirestore(postMap);
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(postData: postData,)
                      ),
                    );
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Semantics( 
            label: widget.errorLabel,
            child: const Center(
              child: Text('Something went wrong...'),
            ),
          );
        } else {
          return Center(
            child: Semantics(
              label: widget.listProgressIndicatorLabel,
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}