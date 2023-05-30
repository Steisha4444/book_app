import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/services/database.dart';
import 'package:book_app/widgets/book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnglishBooks extends StatelessWidget {
  const EnglishBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Book>?>.value(
      value: DatabaseService().englishBooks,
      initialData: null,
      child: const Scaffold(
        body: BooksList(),
      ),
    );
  }
}
