import 'package:flutter/material.dart';
import 'package:smart_parking/parking_lot/paring_lot.dart';
import 'package:smart_parking/parking_lot/parking_lot_details_page.dart';
import 'package:smart_parking/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ParkingHomePage extends StatefulWidget {
  @override
  _ParkingHomePageState createState() => _ParkingHomePageState();
}

class _ParkingHomePageState extends State<ParkingHomePage> {
  final List<ParkingLot> _parkingLots = [
    ParkingLot(name: 'Seasons Mall', totalSpaces: 50, availableSpaces: 25),
    // ParkingLot(name: 'Parking B', totalSpaces: 30, availableSpaces: 20),
// Add more parking lots as needed
  ];

  void _openSidebar() {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 36, 47),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: const Text('Smart Parking'),
      ),
      drawer: Sidebar(),
      body: ListView.builder(
        itemCount: _parkingLots.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              margin: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 40),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Color.fromARGB(255, 147, 234, 249),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParkingLotDetailsPage(
                            parkingLot: _parkingLots[index],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      _parkingLots[index].name,
                      style: GoogleFonts.merriweather(
                          color: Color.fromARGB(255, 0, 98, 255), fontSize: 28),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}