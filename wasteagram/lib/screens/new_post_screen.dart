import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:wasteagram/components/find_location.dart';
import 'package:wasteagram/components/pop_button.dart';
import 'package:wasteagram/components/post_alert.dart';
import 'package:wasteagram/components/upload_image.dart';

class NewPostScreen extends StatefulWidget {

  final title = 'New Post';
  final collectionName = 'posts';
  final XFile? image;
  final backButtonHint = 'Go back to the post list screen';
  final imageLabel = 'Image of food waste';
  final numberInputHint = 'Tap to enter number';
  final uploadButtonHint = 'Upload this new post to Wasteagram';

  const NewPostScreen({ Key? key, required this.image }) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {

  final quantityController = TextEditingController();
  LocationData? locationData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: Semantics(
          button: true,
          enabled: true,
          onTapHint: widget.backButtonHint,
          child: const PopButton(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Semantics(
              label: widget.imageLabel,
              child: Image.file(
                File(widget.image!.path),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Semantics(
                enabled: true,
                onTapHint: widget.numberInputHint,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: quantityController,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                  decoration: const InputDecoration(
                    hintText: 'Number of Wasted Items'
                  ),
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Spacer()
          ),
        ],
      ),
      bottomSheet: Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Semantics(
            button: true,
            enabled: true,
            onTapHint: widget.uploadButtonHint,
            child: ElevatedButton(
              child: const Icon(
                Icons.cloud_upload,
                size: 60,
              ), 
              onPressed: () async {
                if (quantityController.text.isEmpty) {
                  postAlert(
                    context, 
                    'Number Required:', 
                    'Please enter a number of wasted items'
                  );
                } else {
                  int quantity = int.parse(quantityController.text);
                  locationData = await findLocation();
                  if (locationData == null) {
                    postAlert(
                      context, 
                      'Location Required:', 
                      'Your location count not be found'
                    );
                  } else {
                    var latitude = locationData!.latitude;
                    var longitude = locationData!.longitude;
                    String imageURL = await uploadImage(widget.image);
                    DateTime currentDate = DateTime.now();
                    Timestamp date = Timestamp.fromDate(currentDate);
                    String postID = currentDate.millisecondsSinceEpoch.toString();
                    FirebaseFirestore.instance
                      .collection(widget.collectionName).doc(postID).set({
                        'date': date, 
                        'imageURL': imageURL, 
                        'latitude': latitude,
                        'longitude': longitude,
                        'quantity': quantity,
                      });
                    Navigator.pop(context);
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}