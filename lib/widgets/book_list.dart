import 'package:book_app/modules/book/models/book.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'book_tile.dart';

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  Widget build(BuildContext context) {
    final books = Provider.of<List<Book>?>(context) ?? [];

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookTile(book: books[index]);
      },
    );
  }
}
