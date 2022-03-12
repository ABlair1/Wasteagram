import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/test.dart';
import 'package:wasteagram/models/post_data.dart';

void main() {
  test(
    'PostData date type is correctly converted from Map date type', 
    () {
      final date = Timestamp.now();

      final postData = PostData.fromCloudFirestore({
        'date': date,
        'imageURL': 'test',
        'latitude': 1.0,
        'longitude': 1.0,
        'quantity': 1,
      });

      expect(date.runtimeType, Timestamp);
      expect(postData.date.runtimeType, DateTime);
    }
  );

  test(
    'PostData id and date reference the same date and time', 
    () {
      final id = Timestamp.fromDate(DateTime.parse('2022-03-11'))
        .millisecondsSinceEpoch.toString();
      final date = Timestamp.fromDate(DateTime.parse('2022-03-11'));

      final postData = PostData.fromCloudFirestore({
        'date': date,
        'imageURL': 'test',
        'latitude': 1.0,
        'longitude': 1.0,
        'quantity': 1,
      });

      expect(postData.id, date.millisecondsSinceEpoch.toString());
      expect(postData.date, DateTime.fromMillisecondsSinceEpoch(int.parse(id)));
    }
  );

  test(
    'PostData created from a Map should contain correct data from Map', 
    () {
      final id = Timestamp.fromDate(DateTime.parse('2022-03-11'));
      final date = Timestamp.fromDate(DateTime.parse('2022-03-11'));
      const imageURL = 'https://firebasestorage.googleapis.com/v0/b/wasteagram-5fa2c.appspot.com/o/2022-03-10%2021%3A40%3A19.455356.jpg?alt=media&token=1d6559e9-ecd9-4fc9-96bf-d7f0d64c850f';
      const latitude = 39.6386;
      const longitude = -78.4630;
      const quantity = 2;

      final postData = PostData.fromCloudFirestore({
        'date': date,
        'imageURL': imageURL,
        'latitude': latitude,
        'longitude': longitude,
        'quantity': quantity,
      });

      expect(postData.id, id.toDate().millisecondsSinceEpoch.toString());
      expect(postData.date, date.toDate());
      expect(postData.imageURL, imageURL);
      expect(postData.latitude, latitude);
      expect(postData.longitude, longitude);
      expect(postData.quantity, quantity);
    }
  );

}