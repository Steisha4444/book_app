import 'package:book_app/modules/book/models/book.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    super.key,
    required this.width,
    required this.book,
  });

  final double width;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15), // Image border
          child: SizedBox.fromSize(
            size: Size(width, 400), // Image radius
            child: Image.network(
              book.cover,
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
