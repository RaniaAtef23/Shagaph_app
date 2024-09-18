import 'package:flutter/material.dart';

import 'Adertisement_item_widget.dart'; // Ensure the correct file name

class AdvertisementListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> advertisements; // Assuming your data is in a list of maps

  const AdvertisementListWidget({super.key, required this.advertisements});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: advertisements.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: AdertisementItemWidget(
            imagePath: advertisements[index]['imagePath'], // Access image path from the map
          ),
        );
      },
    );
  }
}
