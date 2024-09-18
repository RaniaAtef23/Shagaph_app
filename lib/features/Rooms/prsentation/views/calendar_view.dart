import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_router.dart';
import 'widgets/calender_widget.dart';
import 'widgets/card_seat.dart';
import 'widgets/time_widget.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  bool _isFinished = false;
  DateTime _fromTime = DateTime.now();
  DateTime _toTime = DateTime.now();
  DateTime today = DateTime.now();

  void _onDateSelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            GoRouter.of(context).go(AppRouter.kRoominfoScreen);
          },
            child: Icon(Icons.arrow_back_ios_outlined, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Select date and time',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: CalenderWidget(),
            ),
            const SizedBox(height: 20),
            // From Time Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TimeWidget(
                label: 'From:',
                selectedTime: _fromTime,
                onTimeChange: (time) {
                  setState(() {
                    _fromTime = time;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            // To Time Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TimeWidget(
                label: 'To:',
                selectedTime: _toTime,
                onTimeChange: (time) {
                  setState(() {
                    _toTime = time;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            // Card Seat Widget
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: CardSeat(),
            ),
            const SizedBox(height: 50),
            // Next Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isFinished = !_isFinished; // Toggle the state on tap
                  });

                  // Delay for 2 seconds before navigating
                  Future.delayed(const Duration(seconds: 1), () {
                    GoRouter.of(context).go(AppRouter.kRoominfoScreen);
                  });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFinished ?  const Color(0xff919393) : const Color(0xFF20473E),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015,
                    horizontal: MediaQuery.of(context).size.width * 0.35,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  _isFinished ? 'Loading...' : 'Finish', // Change text based on state
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Comfortaa',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
