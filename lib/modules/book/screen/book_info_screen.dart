import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/widgets/book_cover.dart';
import 'package:book_app/widgets/rating_widget.dart';
import 'package:book_app/widgets/read_button.dart';
import 'package:flutter/material.dart';

class BookInfoScreen extends StatelessWidget {
  const BookInfoScreen({super.key, required this.book});
  final Book book;
  TextStyle getTextStyle(context) {
    final style = TextStyle(
      fontSize: 16,
      color: Theme.of(context).secondaryHeaderColor,
    );
    return style;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 32;
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookCover(width: width, book: book),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: ReadButton(book: book),
              ),
              const SizedBox(height: 16),
              Title(bookName: book.name),
              RatingWidget(style: getTextStyle(context), book: book),
              const SizedBox(height: 8),
              Text(book.description, style: getTextStyle(context)),
              const SizedBox(height: 8),
              Text('Author: ${book.author}', style: getTextStyle(context)),
              const SizedBox(height: 8),
              Text('Level: ${book.level.toString().split('.').last}',
                  style: getTextStyle(context)),
              const SizedBox(height: 8),
              Text('Genres: ${book.genres.join(", ")}',
                  style: getTextStyle(context)),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.bookName,
  });

  final String bookName;

  @override
  Widget build(BuildContext context) {
    return Text(
      bookName,
      style: TextStyle(
        fontSize: 24,
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}
