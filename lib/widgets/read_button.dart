import 'package:book_app/core/app_theme.dart';
import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/modules/book/screen/text_screen.dart';
import 'package:book_app/modules/book/screen/auto_translating_text.dart';
import 'package:flutter/material.dart';

class ReadButton extends StatelessWidget {
  const ReadButton({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(
            // width: 5.0,
            color: Colors.transparent,
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).cardColor,
        ),
      ),
      onPressed: () {
        if (book.textUa.isEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AutoTranslatingText(
                book: book,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TextScreen(
                book: book,
              ),
            ),
          );
        }
      },
      child: Text(
        'Read \'${book.name}\'',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
