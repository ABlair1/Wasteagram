import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, dynamic> createPostMap(QueryDocumentSnapshot post) {
  return {
    'date': post['date'],
    'imageURL': post['imageURL'],
    'latitude': post['latitude'],
    'longitude': post['longitude'],
    'quantity': post['quantity'],
  };
}