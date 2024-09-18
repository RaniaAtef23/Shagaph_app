import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/features/More/data/drink_model.dart';
import 'package:shaghaf/features/More/data/drink_provider.dart';

class ColdDrinks extends StatelessWidget {
  final Function(String, int) onQuantityChanged;

  const ColdDrinks({required this.onQuantityChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkProvider>(
      builder: (context, drinkProvider, child) {
        final coldDrinks = drinkProvider.coldDrinks;

        return ListView.builder(
          itemCount: coldDrinks.length,
          itemBuilder: (context, index) {
            final drink = coldDrinks[index];
            return ColdDrinkTile(
              drink: drink,
              onQuantityChanged: onQuantityChanged,
            );
          },
        );
      },
    );
  }
}

class ColdDrinkTile extends StatefulWidget {
  final Drink drink;
  final Function(String, int) onQuantityChanged;

  const ColdDrinkTile({required this.drink, required this.onQuantityChanged, super.key});

  @override
  _ColdDrinkTileState createState() => _ColdDrinkTileState();
}

class _ColdDrinkTileState extends State<ColdDrinkTile> {
  void _incrementQuantity() {
    setState(() {
      widget.drink.quantity1++;
    });
    widget.onQuantityChanged(widget.drink.name, widget.drink.quantity1);
  }

  void _decrementQuantity() {
    if (widget.drink.quantity1 > 0) {
      setState(() {
        widget.drink.quantity1--;
      });
      widget.onQuantityChanged(widget.drink.name, widget.drink.quantity1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0x40000000),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.network(widget.drink.image),
        title: Text(widget.drink.name),
        subtitle: Text('${widget.drink.price.toStringAsFixed(2)} LE'), // Convert price to string with two decimal places
        trailing: Container(
          height: 32.h,
          width: 130.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: const Color(0x40000000),
                spreadRadius: 0,
                blurRadius: 15,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove,
                  size: 16.sp,
                  color: const Color(0xFFF04C29),
                ),
                onPressed: _decrementQuantity,
              ),
              Text('${widget.drink.quantity1}', style: TextStyle(fontSize: 16.sp)),
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 16.sp,
                  color: const Color(0xFFF04C29),
                ),
                onPressed: _incrementQuantity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}