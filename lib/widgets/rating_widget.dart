import 'package:book_app/modules/book/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.style,
    required this.book,
  });

  final TextStyle style;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Rating:   ', style: style),
        RatingBarIndicator(
          unratedColor: Theme.of(context).splashColor.withOpacity(0.5),
          rating: book.rate.toDouble(),
          itemBuilder: (context, index) => Icon(
            Icons.favorite,
            color: Theme.of(context).splashColor,
          ),
          itemCount: 5,
          itemSize: 25,
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}
