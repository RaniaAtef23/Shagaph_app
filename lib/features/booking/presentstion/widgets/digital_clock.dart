import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String _hours = '';
  String _minutes = '';
  String _seconds = '';
  late Timer _timer; // Declare a Timer variable

  @override
  void initState() {
    super.initState();
    _updateTime();
    // Initialize the Timer and store the reference
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  void dispose() {
    // Cancel the Timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    final DateTime now = DateTime.now();
    if (mounted) { // Check if the widget is still mounted before calling setState
      setState(() {
        _hours = now.hour.toString().padLeft(2, '0');
        _minutes = now.minute.toString().padLeft(2, '0');
        _seconds = now.second.toString().padLeft(2, '0');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700, fontFamily: 'Comfortaa'),
            children: [
              TextSpan(
                text: _hours, // Hours
                style: const TextStyle(color: Colors.red), // Hours in red
              ),
              const TextSpan(
                text: ":", // Colon
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: _minutes, // Minutes
                style: const TextStyle(color: Colors.white), // Minutes in white
              ),
              const TextSpan(
                text: ":", // Colon
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: _seconds, // Seconds
                style: const TextStyle(color: Colors.white), // Seconds in white
              ),
            ],
          ),
        ),
      ),
    );
  }
}
