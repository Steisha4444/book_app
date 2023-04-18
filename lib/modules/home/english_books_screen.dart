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
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     'Books List',
        //   ),
        //   backgroundColor: Theme.of(context).cardColor,
        //   elevation: 0.0,
        //   actions: <Widget>[
        //     ElevatedButton.icon(
        //       icon: const Icon(Icons.person),
        //       label: const Text('logout'),
        //       onPressed: () async {
        //         await _auth.signOut();
        //       },
        //     ),
        //   ],
        // ),
        body: const BooksList(),
      ),
    );
  }
}
