import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthdayCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final double titleFontSize;
  final Function(int, String, String) onQuantityChanged;

  const BirthdayCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.titleFontSize = 14,
    required this.onQuantityChanged,
  });

  @override
  _BirthdayCardState createState() => _BirthdayCardState();
}

class _BirthdayCardState extends State<BirthdayCard> {
  int quantity = 0;
  Color cardColor = Colors.white;

  void _incrementQuantity() {
    setState(() {
      quantity++;
      cardColor = const Color.fromRGBO(240, 76, 41, .38);
    });
    widget.onQuantityChanged(quantity, widget.price, widget.title);
  }

  void _decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        if (quantity == 0) {
          cardColor = Colors.white;
        }
      });
      widget.onQuantityChanged(quantity, widget.price, widget.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w, // Responsive width
      height: 110.h, // Responsive height
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12.r), // Responsive border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h), // Responsive padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: widget.titleFontSize.sp, // Responsive font size
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff0A0A0A),
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.price,
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (quantity > 0)
                  Row(
                    children: [
                      CircleAvatar(

                        backgroundColor: Colors.grey.withOpacity(0.3),
                        child: IconButton(
                          icon: Icon(Icons.remove_sharp, color: Color(0xffF04C29), size: 23.sp,),
                          onPressed: _decrementQuantity,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.w),
                        child: Text(
                          '$quantity',
                          style:  TextStyle(
                            color: Colors.black,
                            fontFamily: 'Comfortaa',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                CircleAvatar(
                  // radius: 25.r,
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  child: IconButton(
                    icon:  Icon(Icons.add, color: Color(0xffF04C29), size: 23.sp,),
                    onPressed: _incrementQuantity,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
