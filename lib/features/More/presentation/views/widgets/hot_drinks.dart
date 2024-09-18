import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shaghaf/features/More/data/drink_model.dart';
import 'package:shaghaf/features/More/data/drink_provider.dart';

class HotDrinks extends StatelessWidget {
  final Function(String, int) onQuantityChanged;

  const HotDrinks({required this.onQuantityChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkProvider>(
      builder: (context, drinkProvider, child) {
        final hotDrinks = drinkProvider.hotDrinks;

        return ListView.builder(
          itemCount: hotDrinks.length,
          itemBuilder: (context, index) {
            final drink = hotDrinks[index];
            return HotDrinkTile(
              drink: drink,
              onQuantityChanged: onQuantityChanged,
            );
          },
        );
      },
    );
  }
}

class HotDrinkTile extends StatefulWidget {
  final Drink drink;
  final Function(String, int) onQuantityChanged;

  const HotDrinkTile({required this.drink, required this.onQuantityChanged, super.key});

  @override
  _HotDrinkTileState createState() => _HotDrinkTileState();
}

class _HotDrinkTileState extends State<HotDrinkTile> {
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
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.network(widget.drink.image),
        title: Text(widget.drink.name),
        subtitle: Text('${widget.drink.price.toStringAsFixed(2)} LE'), // Ensure price is converted to string
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Color(0xFFF04C29)),
              onPressed: _decrementQuantity,
            ),
            Text('${widget.drink.quantity1}'),
            IconButton(
              icon: Icon(Icons.add, color: Color(0xFFF04C29)),
              onPressed: _incrementQuantity,
            ),
          ],
        ),
      ),
    );
  }
}
