import 'package:flutter/material.dart';
import 'package:smart_parking/parking_lot/paring_lot.dart';
import 'package:smart_parking/vehicle_selection/vehicle_selection_page.dart';

class ParkingLotDetailsPage extends StatefulWidget {
  final ParkingLot parkingLot;

  const ParkingLotDetailsPage({required this.parkingLot, super.key});

  @override
  _ParkingLotDetailsPageState createState() => _ParkingLotDetailsPageState();
}

class _ParkingLotDetailsPageState extends State<ParkingLotDetailsPage> {
  void _reserveParkingSpace() {
    if (widget.parkingLot.availableSpaces > 0) {
      setState(() {
        widget.parkingLot.availableSpaces--;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Parking space reserved!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No available spaces.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 36, 47),
      appBar: AppBar(
        title: Text(widget.parkingLot.name),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Spaces: ${widget.parkingLot.totalSpaces}',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 186, 245, 254),
              ),
            ),
            Text(
              'Available Spaces: ${widget.parkingLot.availableSpaces}',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 186, 245, 254),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 0, 217, 255),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VehicleSelectionPage()),
                );
              },
              child: const Text(
                'Select vehicle',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
