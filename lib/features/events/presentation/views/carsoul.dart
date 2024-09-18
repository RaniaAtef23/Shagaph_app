import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/events/presentation/widgets/carsoul_widget.dart';


class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420.h, // You can define a fixed height or use MediaQuery here
      child: const CursoulWidget(),
    );
  }
}
