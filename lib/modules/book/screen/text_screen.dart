import 'package:book_app/modules/book/models/book.dart';
import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? PageView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                book.textEn.length,
                (index) => VerticalText(
                  englishText: book.textEn[index],
                  ukrainianText: book.textUa[index],
                ),
              ))
          : Container(),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({
    super.key,
    required this.englishText,
    required this.ukrainianText,
  });
  final String englishText;
  final String ukrainianText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [Text(englishText)],
                ),
              ),
            ),
            const Divider(
              thickness: 10,
              indent: 0.6,
              height: 40,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [Text(ukrainianText)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
