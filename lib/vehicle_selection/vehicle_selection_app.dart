import 'package:flutter/material.dart';
import 'package:smart_parking/vehicle_selection/vehicle_selection_page.dart';

class VehicleSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Selection',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: VehicleSelectionPage(),
    );
  }
}
