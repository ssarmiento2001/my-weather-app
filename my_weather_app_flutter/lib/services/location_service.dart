import 'package:location/location.dart';

class LocationService {
  final _location = Location();

  Future<bool> serviceEnabled() async => _location.serviceEnabled();

  Future<void> requestService() async => _location.requestService();

  Future<bool> permissionGranted() async {
    final permission = await _location.hasPermission();
    return permission == PermissionStatus.granted;
  }

  Future<void> requestPermission() async => _location.requestPermission();

  Future<(String?, LocationData?)> requestLocationData() async {
    try {
      final result = await _location.getLocation();
      return (null, result);
    } catch (e) {
      return (e.toString(), null);
    }
  }
}
