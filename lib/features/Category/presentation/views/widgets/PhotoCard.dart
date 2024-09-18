import 'package:flutter/material.dart';

class PhotoCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final double titleFontSize;
  final Function() onCardSelected;
  final bool isSelected;

  const PhotoCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.titleFontSize = 14,
    required this.onCardSelected,
    this.isSelected = false,
  });

  @override
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  int quantity = 0;
  Color cardColor = Colors.white;

  void _incrementQuantity() {
    setState(() {
      quantity++;
      cardColor = const Color.fromRGBO(240, 76, 41, 0.38);
    });
    widget.onCardSelected();
  }

  @override
  void didUpdateWidget(PhotoCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    cardColor = widget.isSelected ? const Color.fromRGBO(240, 76, 41, 0.38) : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardSelected,
      child: Container(
        width: 342,
        height: 80,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: widget.titleFontSize,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff0A0A0A),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              if (!widget.isSelected)
                CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Color(0xffF04C29)),
                    onPressed: _incrementQuantity,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
