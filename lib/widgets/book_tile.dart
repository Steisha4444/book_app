import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/modules/book/screen/book_info_screen.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookInfoScreen(
              book: book,
            ),
          ),
        ),
        child: Card(
          margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(book.cover),
              radius: 25.0,
            ),
            title: Text(book.name),
            subtitle: Text(
              book.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
