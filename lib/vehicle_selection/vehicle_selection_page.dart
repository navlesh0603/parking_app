import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking/booked_screen.dart';

class VehicleSelectionPage extends StatefulWidget {
  @override
  _VehicleSelectionPageState createState() => _VehicleSelectionPageState();
}

class _VehicleSelectionPageState extends State<VehicleSelectionPage> {
  String _selectedVehicleType = '';

  final _licensePlateController = TextEditingController();
  final _timeController = TextEditingController();

  Future data() async {
    await FirebaseFirestore.instance.collection('Users').add({
      'license': _licensePlateController.text.trim(),
      'time': _timeController.text.trim(),
    });
  }

  void _showLicensePlateDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 185, 231, 247)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _licensePlateController,
                    decoration: const InputDecoration(
                      labelText: 'License Plate Number',
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 14, 3, 227)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _timeController,
                    decoration: const InputDecoration(
                      labelText: 'Time',
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 0, 14, 208)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 215, 253),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15)),
                    onPressed: () async {
                      data();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CheckmarkScreen())); // Close the bottom sheet
                      String licensePlate = _licensePlateController.text;
                      String time = _timeController.text;

                      // Perform actions with the selected vehicle type and license plate
                      // You can save this information or proceed as needed
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 36, 47),
      appBar: AppBar(
        title: const Text('Vehicle Selection'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/park.png',
              width: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 215, 253),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              onPressed: () {
                setState(() {
                  _selectedVehicleType = '2-Wheeler';
                  _showLicensePlateDialog(context);
                });
              },
              child: const Text('2-Wheeler'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Color.fromARGB(255, 0, 215, 253),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              onPressed: () {
                setState(() {
                  _selectedVehicleType = '4-Wheeler';
                  _showLicensePlateDialog(context);
                });
              },
              child: const Text('4-Wheeler'),
            ),
          ],
        ),
      ),
    );
  }
}