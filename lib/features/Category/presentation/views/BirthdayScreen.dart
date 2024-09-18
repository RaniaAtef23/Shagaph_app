import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:shaghaf/features/Home/presentation/views/MainSCREEN.dart';
import '../../../../core/utils/app_router.dart';
import '../Manger/Birthday/birthday_cubit.dart';
import '../Manger/Birthday/birthday_state.dart';
import 'widgets/BirthdayCardList.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);

    final List<Map<String, String>> cakeCardData = [
      {'imagePath': 'assets/cake2.png', 'title': 'From 1 to 6 persons', 'price': '300 LE'},
      {'imagePath': 'assets/cake2.png', 'title': 'From 7 to 10 persons', 'price': '500 LE'},
      {'imagePath': 'assets/cake3.png', 'title': 'From 11 to 20 persons', 'price': '750 LE'},
    ];

    final List<Map<String, String>> decorationCardData = [
      {'imagePath': 'assets/deco1.png', 'title': '2 helium balloons, etc.', 'price': '450 LE'},
      {'imagePath': 'assets/deco2.png', 'title': 'Without helium balloons', 'price': '350 LE'},
    ];

    return BlocProvider(
      create: (_) => BirthdayCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: InkWell(
            onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context)=>MainScreen())); },
            child:  Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Birthday',
            style: TextStyle(color: Colors.black, fontSize: 20.sp), // Responsive title font size
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(26.0.w), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoContainer(),
                SizedBox(height: 30.h), // Responsive height
                _sectionTitle('Cakes'),
                BlocBuilder<BirthdayCubit, BirthdayState>(
                  builder: (context, state) {
                    return BirthdayCardList(
                      birthdayCardData: cakeCardData,
                      onCardQuantityChanged: (quantity, price, title) {
                        context.read<BirthdayCubit>().updateTotalPrice(quantity, price, title);
                      },
                    );
                  },
                ),
                SizedBox(height: 30.h), // Responsive height
                _sectionTitle('Decorations'),
                BlocBuilder<BirthdayCubit, BirthdayState>(
                  builder: (context, state) {
                    return BirthdayCardList(
                      birthdayCardData: decorationCardData, // Updated to use decoration data
                      onCardQuantityChanged: (quantity, price, title) {
                        context.read<BirthdayCubit>().updateTotalPrice(quantity, price, title);
                      },
                    );
                  },
                ),
                SizedBox(height: 30.h), // Responsive height
                _buildTotalPriceContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h), // Responsive padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: CircleAvatar(radius: 5.r, backgroundColor: Colors.red),
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              'You can buy them from anywhere else without any cost or services',
              style: TextStyle(fontSize: 12.sp), // Consider making this responsive too
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0.h), // Responsive padding
      child: Text(
        title,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400), // Responsive title font size
      ),
    );
  }

  Widget _buildTotalPriceContainer() {
    return BlocBuilder<BirthdayCubit, BirthdayState>(
      builder: (context, state) {
        double totalPrice = 0.0;

        if (state is BirthdayUpdated) {
          totalPrice = state.totalPrice;
        }

        // Return an empty container if the total price is zero
        if (totalPrice == 0.0) {
          return const SizedBox(); // Or return an empty Container()
        }

        return Container(
          width: double.infinity,
          height: 45.h, // Responsive height
          decoration: BoxDecoration(
            color: const Color(0xFF20473E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0.w), // Responsive padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0.w), // Responsive padding
                  child: Text(
                    'Total Price',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Comfortaa'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0.w), // Responsive padding
                  child: Text(
                    'EG ${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Comfortaa'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
