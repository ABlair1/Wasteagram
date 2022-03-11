import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<String> uploadImage(XFile? image) async {
  var fileName = DateTime.now().toString() + '.jpg';
  Reference cloudStorage = FirebaseStorage.instance.ref().child(fileName);
  UploadTask uploadTask = cloudStorage.putFile(File(image!.path));
  await uploadTask;
  final imageURL = await cloudStorage.getDownloadURL();
  return imageURL;
}
