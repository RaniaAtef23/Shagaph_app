import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaghaf/features/More/presentation/views/order_screen.dart';

import '../../../../More/presentation/views/ContactUsScreen.dart';
import '../../../../More/presentation/views/NotificationScreen.dart';
import '../../../../More/presentation/views/ProfileScreen.dart';

class DrawerWidget extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const DrawerWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String selectedLanguage = 'English'; // Default language

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: widget.screenWidth * 0.75,
      child: Column(
        children: [
          SizedBox(
            height: widget.screenHeight * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: widget.screenHeight * 0.05,
                      left: widget.screenWidth * 0.05),
                  child: SizedBox(
                    width: widget.screenWidth * 0.25,
                    height: widget.screenWidth * 0.4,
                    child: Image.asset('assets/LOGO FINAL 1.png'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: widget.screenWidth * 0.07,
                    top: widget.screenHeight * 0.02),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.account_circle_outlined,
                          color: const Color(0xffF04C29),
                          size: widget.screenWidth * 0.06),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: widget.screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language,
                          color: const Color(0xffF04C29),
                          size: widget.screenWidth * 0.06),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton<String>(
                            underline: const SizedBox(), // Removes the underline
                            value: selectedLanguage,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Color(0xffF04C29)),
                            style: TextStyle(
                              fontSize: widget.screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Comfortaa',
                              color: Colors.black,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedLanguage = newValue!;
                              });
                            },
                            items: <String>[
                              'English',
                              'Arabic',
                              'Spanish',
                              'French'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart_outlined,
                          color: const Color(0xffF04C29),
                          size: widget.screenWidth * 0.06),
                      title:  Text(
                          'Orders',
                          style: TextStyle(
                            fontSize: widget.screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Comfortaa',
                          ),
                        ),

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderScreen()));
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 4.w),

                              child: IconButton(
                                icon: Image.asset(
                                  "assets/material-symbols_notifications-unread-outline.png",
                                  color: const Color(0xffF04C29),
                                ),
                                iconSize: 0.04,
                                onPressed: () {

                                },
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              'Notification',
                              style: TextStyle(
                                fontSize: widget.screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.star,
                          color: const Color(0xffF04C29),
                          size: widget.screenWidth * 0.06),
                      title: Text(
                        'Rating',
                        style: TextStyle(
                          fontSize: widget.screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_page_outlined,
                          color: const Color(0xffF04C29),
                          size: widget.screenWidth * 0.06),
                      title: Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: widget.screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Comfortaa',
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUsScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
