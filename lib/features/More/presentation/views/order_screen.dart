import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shaghaf/features/More/presentation/views/widgets/cold_drinks.dart';
import 'package:shaghaf/features/More/presentation/views/widgets/hot_drinks.dart';
import 'package:shaghaf/features/More/presentation/views/widgets/snakes.dart';
import '../../../../core/utils/app_router.dart';
import '../../data/drink_provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  double totalColdDrinksPrice = 0;
  double totalHotDrinksPrice = 0;
  double totalPrice = 0;
  Map<String, int> itemQuantities = {};
  bool showTotalPriceContainer = false;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _updateTotalPrices();
      showTotalPriceContainer = true;
    });
  }

  void _onQuantityChanged(String name, int quantity) {
    setState(() {
      itemQuantities[name] = quantity;
      _updateTotalPrices();
      showTotalPriceContainer = true;
    });
  }

  void _updateTotalPrices() {
    double coldDrinksTotal = 0;
    double hotDrinksTotal = 0;

    if (_selectedIndex == 0) { // Cold Drinks
      for (var drink in DrinkProvider().coldDrinks) {
        int itemQuantity = itemQuantities[drink.name] ?? 0;
        coldDrinksTotal += (drink.price * itemQuantity);
      }
      // Accumulate the cold drinks total
      totalColdDrinksPrice = coldDrinksTotal;
    } else if (_selectedIndex == 1) { // Hot Drinks
      for (var drink in DrinkProvider().hotDrinks) {
        int itemQuantity = itemQuantities[drink.name] ?? 0;
        hotDrinksTotal += (drink.price * itemQuantity);
      }
      // Accumulate the hot drinks total
      totalHotDrinksPrice = hotDrinksTotal;
    }

    totalPrice = totalColdDrinksPrice + totalHotDrinksPrice;
  }

  final TextStyle listTileTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Comfortaa',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).go(AppRouter.kMainScreen);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Orders',
          style: listTileTextStyle.copyWith(
            color: const Color(0xff111111),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 154.h,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavItem('Cold Drinks', 'assets/Ellipse 39.png', 0),
                  SizedBox(width: 20.w),
                  _buildNavItem('Hot Drinks', 'assets/Ellipse 40.png', 1),
                  SizedBox(width: 20.w),
                  _buildNavItem('Snakes', 'assets/Ellipse 41.png', 2),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: _selectedIndex == 0
                  ? ColdDrinks(onQuantityChanged: _onQuantityChanged)
                  : _selectedIndex == 1
                  ? HotDrinks(onQuantityChanged: _onQuantityChanged)
                  : Snakes(), // Add onQuantityChanged callback to Snakes
            ),
          ),
          if (showTotalPriceContainer)
            Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: Color(0xFF20473E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 8.w),
                  Row(
                    children: [
                      Text(
                        '        Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 190.w,),
                      Text(
                        'EGP ${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String imagePath, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? const Color(0xFFF04C29)
                  : const Color(0xFF383838),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2.0,
            width: 70,
            color: _selectedIndex == index
                ? const Color(0xFFF04C29)
                : Colors.transparent,
          ),
        ],
      ),
    );
  }
}