import 'package:flutter/material.dart';
import 'BirthdayCard.dart';

class BirthdayCardList extends StatefulWidget {
  final List<Map<String, String>> birthdayCardData;
  final bool isDecoration;
  final Function(int, String, String) onCardQuantityChanged;

  const BirthdayCardList({
    super.key,
    required this.birthdayCardData,
    this.isDecoration = false,
    required this.onCardQuantityChanged,
  });

  @override
  _BirthdayCardListState createState() => _BirthdayCardListState();
}

class _BirthdayCardListState extends State<BirthdayCardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.birthdayCardData.length,
      itemBuilder: (context, index) {
        final cardData = widget.birthdayCardData[index];
        final imagePath = cardData['imagePath'];
        final title = cardData['title'];
        final price = cardData['price'];

        if (imagePath == null || title == null || price == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: BirthdayCard(
            imagePath: imagePath,
            title: title,
            price: price,
            titleFontSize: widget.isDecoration ? 12 : 14,
            onQuantityChanged: widget.onCardQuantityChanged,
          ),
        );
      },
    );
  }
}
