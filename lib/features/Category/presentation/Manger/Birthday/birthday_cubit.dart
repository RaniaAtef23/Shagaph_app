import 'package:bloc/bloc.dart';
import 'birthday_state.dart';

class BirthdayCubit extends Cubit<BirthdayState> {
  BirthdayCubit() : super(BirthdayInitial());

  void updateTotalPrice(int quantity, String price, String itemTitle) {
    final itemPrice = double.parse(price.split(' ')[0]);

    final newSelectedItems = (state is BirthdayUpdated)
        ? Map<String, int>.from((state as BirthdayUpdated).selectedItems)
        : <String, int>{};

    if (quantity == 0) {
      newSelectedItems.remove(itemTitle);
    } else {
      newSelectedItems[itemTitle] = quantity;
    }

    double totalPrice = newSelectedItems.entries
        .map((entry) => entry.value * itemPrice)
        .fold(0.0, (previousValue, element) => previousValue + element);

    emit(BirthdayUpdated(totalPrice: totalPrice, selectedItems: newSelectedItems));
  }
}
