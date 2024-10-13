import 'package:flutter/material.dart';

class BookImageView extends StatelessWidget {
  final String bookImage;

  const BookImageView(this.bookImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Image.network(
        bookImage,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
              'assets/images/placeholder.jpg'); // Fallback placeholder
        },
      ),
    );
  }
}
