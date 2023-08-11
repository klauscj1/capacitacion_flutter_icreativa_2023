import 'package:flutter_meedu/meedu.dart';
import 'package:location/location.dart';

final gpsProvider = SimpleProvider<GpsController>((ref) => GpsController());

class GpsController extends SimpleNotifier {
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool _iniciado = false;

  LocationData get locationData => _locationData;

  Future<void> obtenerUbicacion() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (!_iniciado) {
      iniciarGps();
    }
    _locationData = await location.getLocation();
    notify();
  }

  void iniciarGps() {
    _iniciado = true;
    location.onLocationChanged.listen((LocationData currentLocation) {
      _locationData = currentLocation;
      notify();
      print("location change => $_locationData");
    });
  }
}
