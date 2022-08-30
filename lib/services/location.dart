import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  void checkPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied) {
      await permission.request();
    }
  }

  Future getCurrentLocation() async {
    try {
      checkPermission(Permission.location);
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
