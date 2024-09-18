import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/BottomNavigationBarWidget.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/CircularAvatarWidget.dart';
import 'package:shaghaf/features/Home/presentation/views/widgets/DrawerWidget.dart';
import 'package:shaghaf/features/booking/presentstion/views/book_history_screen.dart';
import 'package:shaghaf/features/offers/presentation/views/offers_screen.dart';
import '../../../More/presentation/views/SettingScreen.dart';
import 'HomeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
   const BookHistoryScreen(),
    const OffersGridPage(),
    const SettingScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: DrawerWidget(
          screenWidth: screenWidth,
          screenHeight: screenHeight), // Use the DrawerWidget
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            left: screenWidth * 0.04, // 24.0.w
            top: screenHeight * 0.04, // 45.h
            child: Builder(
              builder: (context) => IconButton(
                icon: Image.asset(
                  "assets/up_bar.png",
                  fit: BoxFit.contain,
                  height: screenHeight * 0.08, // 36.h
                  width: screenWidth * 0.08, // 36.w
                ),
                onPressed: () {
                  // Open the drawer
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 0.w,
            right: 0.w,
            child: BottomNavigationBarWidget(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
          Positioned(
            left: screenWidth / 2 - (screenWidth * 0.10), // Center the avatar
            bottom: screenWidth * 0.1, // Adjust position based on screen width
            child: const CircularAvatarWidget(
              imagePath: 'assets/Frame 1143 (1).png',
            ),
          ),
        ],
      ),
    );
  }
}
