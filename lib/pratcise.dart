import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:battery_plus/battery_plus.dart';

class CustomStatusBar extends StatefulWidget {
  @override
  _CustomStatusBarState createState() => _CustomStatusBarState();
}

class _CustomStatusBarState extends State<CustomStatusBar> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  BatteryState _batteryState = BatteryState.full;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _getBatteryInfo();
    _startClock();
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
    });
  }

  // Function to get battery level
  Future<void> _getBatteryInfo() async {
    final batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  // Start the clock to show current time
  void _startClock() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      final now = DateTime.now();
      setState(() {
        _currentTime = '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05, // Custom height
      width: Get.width,          // Full width
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black,    // Status bar background color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Time display
          Text(
            _currentTime,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          // Battery status display
          Row(
            children: [
              Icon(
                _batteryState == BatteryState.charging
                    ? Icons.battery_charging_full
                    : Icons.battery_full,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                '$_batteryLevel%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
