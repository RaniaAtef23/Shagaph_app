import 'package:flutter/material.dart';

class CardSeat extends StatefulWidget {
  const CardSeat({super.key});

  @override
  State<CardSeat> createState() => _CardSeatState();
}

class _CardSeatState extends State<CardSeat> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 390,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8), // You can set the radius here
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons. account_circle_outlined, size: 24,),
                    SizedBox(width: 8), // Space between icon and text
                    Text(
                      "Number of seats",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff383838),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0), // Horizontal padding
                    child: IconButton(
                      icon: Image.asset('assets/tabler_minus.png'),
                      onPressed: () {
                        setState(() {
                          if (counter > 0) {
                            counter--;
                          }
                        });
                      },
                    ),
                  ),
                  Text(
                    "$counter",
                    style: const TextStyle(fontSize: 14, color: Colors.black), // Font size
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0), // Horizontal padding
                    child: IconButton(
                      iconSize: 18, // Icon size
                      icon: Image.asset('assets/ic_round-plus.png'),
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
