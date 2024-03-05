import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _location = '上海';
  String _weather = '阴';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.pin_drop,
              size: 40,
              color: Colors.blue,
            ),
            Text(_location),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.cloud,
              size: 30,
              color: Colors.blue,
            ),
            SizedBox(width: 10),
            Text(
              _weather,
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
