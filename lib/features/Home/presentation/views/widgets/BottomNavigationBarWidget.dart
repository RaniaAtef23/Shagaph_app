import 'package:flutter/material.dart';
import 'BottomNavigationBarItemWidget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      height: screenWidth * 0.19,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03), // Padding based on screen width
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                BottomNavigationBarItemWidget(
                  imagePath: 'assets/lets-icons_home-fill (1).png',
                  label: 'Home',
                  isSelected: selectedIndex == 0,
                  onTap: () => onItemTapped(0),
                  ),
                BottomNavigationBarItemWidget(
                  imagePath: 'assets/jam_write-f.png',
                  label: 'Book',
                  isSelected: selectedIndex == 1,
                  onTap: () => onItemTapped(1),
                 ),
              ],
            ),
            SizedBox(width: screenWidth * 0.05), // Spacer based on screen width
            Row(
              children: [
                BottomNavigationBarItemWidget(
                  imagePath: 'assets/ic_baseline-local-offer.png',
                  label: 'Offers',
                  isSelected: selectedIndex == 2,
                  onTap: () => onItemTapped(2),
                   ),
                BottomNavigationBarItemWidget(
                  imagePath: 'assets/ph_list-light.png',
                  label: 'More',
                  isSelected: selectedIndex == 3,
                  onTap: () => onItemTapped(3),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
