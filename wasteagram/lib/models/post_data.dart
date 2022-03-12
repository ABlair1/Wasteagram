class PostData {
  final String id;
  final DateTime date;
  final String imageURL;
  final double latitude;
  final double longitude;
  final int quantity;

  PostData({
    required this.id, 
    required this.date, 
    required this.imageURL, 
    required this.latitude, 
    required this.longitude, 
    required this.quantity,
  });

  factory PostData.fromCloudFirestore(Map<String, dynamic> post)  {
    return PostData(
      id: post['date'].toDate().millisecondsSinceEpoch.toString(), 
      date: post['date'].toDate(), 
      imageURL: post['imageURL'], 
      latitude: post['latitude'], 
      longitude: post['longitude'], 
      quantity: post['quantity'],
    );
  }
}