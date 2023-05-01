import 'package:book_app/core/app_theme.dart';
import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/services/auth.dart';
import 'package:book_app/services/database.dart';
import 'package:book_app/widgets/book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnglishBooks extends StatelessWidget {
  final AuthService _auth = AuthService();

  EnglishBooks({super.key});

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
