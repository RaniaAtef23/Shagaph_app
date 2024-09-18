import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/Rooms/prsentation/views/widgets/Image_cursoul_widget.dart';


class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 454.h, // You can define a fixed height or use MediaQuery here
      child: const ImageCarouselWidget(),
    );
  }
}
