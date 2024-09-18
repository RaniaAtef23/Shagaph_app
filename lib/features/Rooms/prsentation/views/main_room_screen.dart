import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/Rooms/prsentation/views/widgets/room_widget.dart';
import '../../../../core/utils/app_router.dart';
import '../../data/models/room.dart'; // Corrected the path

class RoomScreen extends StatelessWidget {
  RoomScreen({super.key});

  // Create the list of Room objects
  final List<Room> rooms = [
    Room(name: "Training room", image: "assets/Rectangle 349.png"),
    Room(name: "Funny room", image: "assets/Rectangle 349 (1).png"),
    Room(name: "Meeting room", image: "assets/Rectangle 349 (2).png"),
    Room(name: "Eating room", image: "assets/Rectangle 349 (3).png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            GoRouter.of(context).go(AppRouter.kMainScreen);
          },
            child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Rooms',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) => RoomWidget(
          name: rooms[index].name,
          image: rooms[index].image,
        ),
      ),
    );
  }
}
