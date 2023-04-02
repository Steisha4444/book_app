import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/modules/book/screen/text_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookInfoScreen extends StatelessWidget {
  const BookInfoScreen({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksforGeeks'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(book.cover),
                  radius: 25.0,
                ),
                Text(book.name)
              ],
            ),
            Text(book.description),
            Text('Year: ${book.date}'),
            Text('Author: ${book.author}'),
            Text('Genres: ${book.genres}'),
            RatingBarIndicator(
              rating: book.rate.toDouble(),
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Color.fromARGB(255, 121, 69, 14),
              ),
              itemCount: 5,
              itemSize: 50.0,
              direction: Axis.horizontal,
            ),
            Text(book.description),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TextScreen(
                    book: book,
                  ),
                ),
              ),
              child: const Text('Read'),
            )
          ],
        ),
      ),
    );
  }
}
