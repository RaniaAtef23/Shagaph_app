// lib/drink_provider.dart
import 'package:flutter/foundation.dart';
import 'drink_model.dart';

class DrinkProvider with ChangeNotifier {
  final List<Drink> _coldDrinks = [
    Drink(name: 'Water', price: 10.0, image: 'assets/water.png'),
    Drink(name: 'Juice', price: 15.0 , image: 'assets/juice.png'),
    Drink(name: 'Fresh Juice', price: 20.0 , image: 'assets/fresh.png'),
    Drink(name: 'Pepsi', price: 20.0 , image: 'assets/pepsi.png'),
    Drink(name: 'Fayrouz', price: 20.0, image: 'assets/fayroze.png'),
  ];

  List<Drink> get coldDrinks => _coldDrinks;

  void updateQuantity(int index, int quantity) {
    _coldDrinks[index].quantity1 = quantity;
    notifyListeners();
  }

  final List<Drink> _hotDrinks = [
    Drink(name: 'Hot Chocolate', price: 3.00, image: 'assets/cake2.png'),
    Drink(name: 'Espresso', price: 2.50, image: 'assets/cake2.png'),
    Drink(name: 'Cappuccino', price: 4.00, image: 'assets/cake2.png'),
  ];

  List<Drink> get hotDrinks => _hotDrinks;

  void updateHotQuantity(int index, int quantity) {
    _hotDrinks[index].quantity1 = quantity;
    notifyListeners();
  }
}
