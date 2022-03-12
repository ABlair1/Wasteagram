import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/post_data.dart';

class PostDetail extends StatelessWidget {

  final PostData postData;
  final dateLabel = 'Date food waste post was created';
  final imageLabel = 'Image of food waste';
  final quantityLabel = 'Number of food items wasted';
  final locationLabel = 'Latitude and longitude of location';

  const PostDetail({ Key? key, required this.postData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1, 
          child: Center(
            child: Semantics(
              label: dateLabel,
              child: Text(
                DateFormat.yMMMMEEEEd().format(postData.date),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3, 
          child: Center(
            child: Semantics(
              label: imageLabel,
              child: Image.network(
                postData.imageURL, 
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1, 
          child: Center(
            child: Semantics(
              label: quantityLabel,
              child: Text(
                postData.quantity.toString() + ' items',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1, 
          child: Center(
            child: Semantics(
              label: locationLabel,
              child: Text(
                'Location: (${postData.latitude}, ${postData.longitude})',
              ),
            ),
          ),
        ),
      ],
    );
  }
}