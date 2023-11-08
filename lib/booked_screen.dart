//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_parking/parking_lot/parking_home_page.dart';

class CheckmarkScreen extends StatefulWidget {
  @override
  _CheckmarkScreenState createState() => _CheckmarkScreenState();
}

class _CheckmarkScreenState extends State<CheckmarkScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 50, 66),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              'assets/images/checkmark.gif',
              width: 450,
              height: 450,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ParkingHomePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 58, 194, 61),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            child: const Text(
              'Done!',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}