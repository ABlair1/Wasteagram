import 'package:flutter/material.dart';
import 'package:wasteagram/models/post_data.dart';
import 'package:intl/intl.dart';

class PostDetail extends StatelessWidget {

  final PostData postData;

  const PostDetail({ Key? key, required this.postData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1, 
          child: Center(
            child: Text(
              DateFormat.yMMMMEEEEd().format(postData.date),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        Flexible(
          flex: 3, 
          child: Center(
            child: Image.network(
                postData.imageURL, 
                fit: BoxFit.contain,
            ),
          ),
        ),
        Flexible(
          flex: 1, 
          child: Center(
            child: Text(
              postData.quantity.toString() + ' items',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        Flexible(
          flex: 1, 
          child: Center(
            child: Text(
            'Location: (${postData.latitude}, ${postData.longitude})',
            ),
          ),
        ),
      ],
    );
  }
}