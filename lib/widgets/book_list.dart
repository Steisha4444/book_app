import 'package:book_app/modules/book/models/book.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book_tile.dart';

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Book>?>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BookTile(book: brews[index]);
      },
    );
  }
}
