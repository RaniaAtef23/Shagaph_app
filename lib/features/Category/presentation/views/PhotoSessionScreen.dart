import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/Category/presentation/views/widgets/PhotoList.dart';

import '../../../../core/utils/app_router.dart';

class PhotoSessionScreen extends StatefulWidget {
  const PhotoSessionScreen({super.key});

  @override
  State<PhotoSessionScreen> createState() => _PhotoSessionScreenState();
}

class _PhotoSessionScreenState extends State<PhotoSessionScreen> {
  String? selectedItemPrice;

  void _updateSelectedItemPrice(String price) {
    setState(() {
      selectedItemPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cakeCardData = [
      {
        'imagePath': 'assets/photo1 (3).png',
        'title': 'Filming with a video camera outside the rooms',
        'price': '500 LE',
      },
      {
        'imagePath': 'assets/photo2.png',
        'title': 'Filming with a video camera in the rooms',
        'price': '250 LE',
      },
      {
        'imagePath': 'assets/photo3.png',
        'title': 'Filming with a photo camera. Camera entry fee to the place',
        'price': '400 LE',
      },
    ];

    final List<Map<String, String>> decorationCardData = [
      {
        'imagePath': 'assets/deco1.png',
        'title': '2 helium balloons, a happy birthday ribbon, and two balloons',
        'price': '450 LE',
      },
      {
        'imagePath': 'assets/deco2.png',
        'title': 'Without helium balloons',
        'price': '350 LE',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: InkWell(
          onTap: (){
            GoRouter.of(context).go(AppRouter.kMainScreen);
          },
            child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Photo Session',
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhotoCardList(
                photoCardList: cakeCardData,
                onCardQuantityChanged: (int quantity, String price) {
                  if (quantity > 0) {
                    _updateSelectedItemPrice(price);
                  } else {
                    _updateSelectedItemPrice('0 LE');
                  }
                },
                isDecoration: true,
              ),
              const SizedBox(height: 350),
              Container(
                width: 342,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF20473E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Loading',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          selectedItemPrice ?? '0 LE',
                          style: const TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
