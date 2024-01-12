import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _startPosition;
  double _totalDistance = 0.0;
  bool _isTracking = false;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
  }

  void checkLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  void startTracking() async {
    setState(() {
      _isTracking = true;
    });

    try {
      _startPosition = await Geolocator.getCurrentPosition();

      Geolocator.getPositionStream().listen((Position position) {
        double distance = Geolocator.distanceBetween(
          _startPosition!.latitude,
          _startPosition!.longitude,
          position.latitude,
          position.longitude,
        );

        setState(() {
          _totalDistance += distance;
        });
      });
    } catch (e) {
      setState(() {
        _isTracking = false;
      });
    }
  }

  void stopTracking() {
    setState(() {
      _isTracking = false;
      _totalDistance = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Distance Tracker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Distance: $_totalDistance meters'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isTracking ? null : startTracking,
              child: Text(_isTracking ? 'Tracking...' : 'Start Tracking'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: !_isTracking ? null : stopTracking,
              child: const Text('Stop Tracking'),
            ),
          ],
        ),
      ),
    );
  }
}
