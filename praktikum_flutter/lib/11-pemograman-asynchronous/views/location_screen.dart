import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    } 

    await Future.delayed(const Duration(seconds: 3));
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen - 411253001'),
      ),
      body: Center(
        child: FutureBuilder<Position>(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Mengambil koordinat GPS... (Delay 3s)'),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Terjadi kesalahan: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              if (snapshot.hasData) {
                final pos = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, size: 60, color: Colors.blue),
                      const SizedBox(height: 16),
                      Text(
                        'Latitude: ${pos.latitude}\nLongitude: ${pos.longitude}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }
              return const Text('Tidak ada data lokasi.');
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
