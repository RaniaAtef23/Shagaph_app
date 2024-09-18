import 'package:flutter/material.dart';
import 'amenity_item.dart';

void showAmenitiesBottomSheet(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'All Amenities',
              style: TextStyle(
                fontSize: screenWidth * 0.05, // Responsive font size
                fontWeight: FontWeight.w500,
                fontFamily: 'Comfortaa',
                color: const Color(0xff1B1B1B),
              ),
            ),
            const SizedBox(height: 20.0),
            const Wrap(
              spacing: 16.0,
              runSpacing: 8.0,
              children: [
                AmenityItem(icon: 'assets/solar_printer-line-duotone.png', label: 'Printer, Scanner and photocopier', description: 'Printing, photocopier and scanning services'),
                AmenityItem(icon: 'assets/ion_wifi-outline.png', label: 'Wi-fi', description: 'Free high-speed Wi-Fi'),
                AmenityItem(icon: 'assets/ph_coffee.png', label: 'Free coffee', description: 'Free coffee and tea provided'),
                AmenityItem(icon: 'assets/ic_round-ondemand-video.png', label: 'Video Conf', description: 'Video conferencing setup available'),
                AmenityItem(icon: 'assets/streamline_screen-broadcast.png', label: 'LED screen', description: 'LED screen'),
              ],
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      );
    },
  );
}
