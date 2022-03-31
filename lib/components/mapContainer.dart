import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapContainer extends StatefulWidget {
  @override
  _MapContainerState createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(12.976075582460014, 77.63565918173049),
        zoom: 13,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/anikets08/cktdzm2xd0ptd17pdq7wz8moz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5pa2V0czA4IiwiYSI6ImNrc29heW1sdTBnbzAycG5wcDk5dHVydHgifQ.u4aJDFhLC9NVIC8is82Xyw",
          additionalOptions: {
            "accessToken":
                "pk.eyJ1IjoiYW5pa2V0czA4IiwiYSI6ImNrc29heW1sdTBnbzAycG5wcDk5dHVydHgifQ.u4aJDFhLC9NVIC8is82Xyw",
            "id": "mapbox.mapbox-streets-v8"
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 30.0,
              height: 30.0,
              point: LatLng(12.976075582460014, 77.63565918173049),
              builder: (context) => GestureDetector(
                onTap: () {},
                child: Container(
                  child: const Center(
                      child: Icon(
                    Icons.location_pin,
                    color: Colors.white,
                  )),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
