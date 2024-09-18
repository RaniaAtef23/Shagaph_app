import 'package:flutter/material.dart';
import 'PhotoCard.dart';

class PhotoCardList extends StatefulWidget {
  final List<Map<String, String>> photoCardList;
  final bool isDecoration;
  final Function(int, String) onCardQuantityChanged;

  const PhotoCardList({
    super.key,
    required this.photoCardList,
    this.isDecoration = false,
    required this.onCardQuantityChanged,
  });

  @override
  _PhotoCardListState createState() => _PhotoCardListState();
}

class _PhotoCardListState extends State<PhotoCardList> {
  int? selectedIndex; // Track the selected index

  void _handleCardSelection(int index, String price) {
    setState(() {
      if (selectedIndex == index) {
        // If the same card is selected again, unselect it
        selectedIndex = null;
      } else {
        selectedIndex = index; // Set the selected index
      }
    });
    widget.onCardQuantityChanged(selectedIndex != null ? 1 : 0, price); // Notify parent of quantity
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.photoCardList.length,
      itemBuilder: (context, index) {
        final cardData = widget.photoCardList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: PhotoCard(
            imagePath: cardData['imagePath']!,
            title: cardData['title']!,
            price: cardData['price']!,
            titleFontSize: widget.isDecoration ? 12 : 14,
            isSelected: selectedIndex == index, // Check if the current card is selected
            onCardSelected: () => _handleCardSelection(index, cardData['price']!), // Handle card selection
          ),
        );
      },
    );
  }
}
