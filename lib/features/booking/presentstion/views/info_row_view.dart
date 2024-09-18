import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/info_item_model.dart';
import '../widgets/info_row_widget.dart';

class InfoList extends StatelessWidget {
  final List<InfoItem> items = [
    InfoItem(imagePath: "assets/iconamoon_clock-light.png", label: "Time", value1: "09:00 AM"),
    InfoItem(imagePath: "assets/mdi_love-seat-outline.png", label: "Seats", value1: "x1"),
    InfoItem(imagePath: "assets/dashicons_money-alt.png", label: "Deposit", value1: "50.00 LE"),
    InfoItem(imagePath: "assets/dashicons_money-alt.png", label: "The rest of the money", value1: "30.00 LE"),
    InfoItem(imagePath: "assets/Group2.png", label: "Coffee", value1: "20.00 LE"),
  ];

  InfoList({super.key}); // Removed const

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: InfoRow(item: items[index]),
        );
      },
    );
  }
}
