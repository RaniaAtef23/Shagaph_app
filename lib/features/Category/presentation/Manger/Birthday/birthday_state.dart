abstract class BirthdayState {}

class BirthdayInitial extends BirthdayState {}

class BirthdayUpdated extends BirthdayState {
  final double totalPrice;
  final Map<String, int> selectedItems;

  BirthdayUpdated({
    required this.totalPrice,
    required this.selectedItems,
  });
}
