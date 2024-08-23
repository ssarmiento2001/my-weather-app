import 'package:location/location.dart';

class LocationService {
  final location = Location();

  Future<bool> serviceEnabled() async => location.serviceEnabled();

  Future<void> requestService() async => location.requestService();

  Future<bool> permissionGranted() async {
    final permission = await location.hasPermission();
    return permission == PermissionStatus.granted;
  }

  Future<void> requestPermission() async => location.requestPermission();
}
