import 'package:location/location.dart';


Future<LocationData?> findLocation() async {
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData? _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      print('Location service could not be enabled.');
      return null;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      print('Location permission is not granted');
      return null;
    }
  }

  _locationData = await location.getLocation();
  return _locationData;
}
