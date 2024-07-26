import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:notification_map_tdd/local_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              LocalNotificationService.showBasicNotificationWhenAnswer();
            },
            icon: Icon(Icons.notification_add),
          ),
        ],
      ),
    );
  }
}


class MyAppTwo extends StatelessWidget {
  const MyAppTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapPage(),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FlutterMap(
        options: MapOptions(
          onPointerDown: (event, point) {
            print(point);
          },
          initialCenter: LatLng(33.510414, 36.278336),
          initialZoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          PolylineLayer(polylines: [
            Polyline(points: [
              LatLng(33.510414, 36.278336),
              LatLng(34, 36.278336),
              LatLng(33.510414, 37),
            ])
          ]),
          PolygonLayer(
            polygons: [
              Polygon(
                isFilled: true,
                color: Colors.amber,
                points: [
                  LatLng(33.510414, 36.278336),
                  LatLng(33.510414, 38),
                  LatLng(32, 38),
                  LatLng(32, 36.278336),
                ],
              ),
            ],
          ),
          CircleLayer(circles: [
            CircleMarker(
              point: LatLng(33.510414, 36.278336),
              radius: 1000,
              useRadiusInMeter: true,
              color: Colors.blue.withOpacity(0.5),
            )
          ]),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(33.510414, 36.278336),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
              ),
              Marker(
                point: LatLng(33.510414, 37),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
