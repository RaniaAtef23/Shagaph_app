import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  ClockState createState() => ClockState();
}

class ClockState extends State<Clock> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(
            () {}); // Check if the widget is still mounted before calling setState
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.w,
      height: 240.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFFFFFFF),
                  spreadRadius: 2,
                  blurRadius: 30,
                  offset: Offset(-15, -8),
                ),
              ],
              shape: BoxShape.circle,
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            child: CustomPaint(
              painter: ClockPainter(context: context),
            ),
          ),
        ],
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;

  ClockPainter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);

    Paint dashPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.square;

    double outerRadius = radius - 10.w;
    double innerRadius = radius - 20.w;

    // Define positions for 3, 6, 9, and 12
    Map<int, String> clockNumbers = {
      0: '3', // 3 o'clock
      90: '6', // 12 o'clock
      180: '9', // 9 o'clock
      270: '12', // 6 o'clock
    };

    for (int i = 0; i < 360; i += 30) {
      double angle = i * pi / 180;
      double x1 = centerX + outerRadius * cos(angle);
      double y1 = centerY + outerRadius * sin(angle);
      double x2 = centerX + innerRadius * cos(angle);
      double y2 = centerY + innerRadius * sin(angle);

      if (clockNumbers.containsKey(i)) {
        // Draw numbers 3, 6, 9, and 12
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: clockNumbers[i],
            style: TextStyle(
              fontSize: 18.sp, // Adjust the font size as needed
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        double textWidth = textPainter.width;
        double textHeight = textPainter.height;

        // Calculate text position offset
        Offset textOffset = Offset(
          x1 - textWidth / 2,
          y1 - textHeight / 2,
        );

        textPainter.paint(canvas, textOffset);
      } else {
        // Draw lines for other hour marks
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashPaint);
      }
    }

    // Draw the clock hands
    DateTime dateTime = DateTime.now();

    // Second hand
    Offset secondEndOffset = Offset(
      centerX + outerRadius * cos((dateTime.second * 6 - 90) * pi / 180),
      centerY + outerRadius * sin((dateTime.second * 6 - 90) * pi / 180),
    );

    // Minute hand
    Offset minEndOffset = Offset(
      centerX + outerRadius * .7 * cos((dateTime.minute * 6 - 90) * pi / 180),
      centerY + outerRadius * .7 * sin((dateTime.minute * 6 - 90) * pi / 180),
    );

    // Hour hand
    Offset hourEndOffset = Offset(
      centerX +
          outerRadius *
              .4 *
              cos(((dateTime.hour % 12) * 30 - 90 + (dateTime.minute / 2)) *
                  pi /
                  180),
      centerY +
          outerRadius *
              .4 *
              sin(((dateTime.hour % 12) * 30 - 90 + (dateTime.minute / 2)) *
                  pi /
                  180),
    );

    // Paints for the clock hands
    Paint secondPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    Paint minPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    Paint hourPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    // Draw the clock hands
    canvas.drawLine(Offset(centerX, centerY), minEndOffset, minPaint);
    canvas.drawLine(Offset(centerX, centerY), hourEndOffset, hourPaint);
    canvas.drawLine(Offset(centerX, centerY), secondEndOffset, secondPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
