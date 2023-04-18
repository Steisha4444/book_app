import 'package:book_app/core/app_theme.dart';
import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/widgets/vertical_text.dart';
import 'package:flutter/material.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key, required this.book});
  final Book book;

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  bool syncScroll = false;
  bool showTranslation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          Row(
            children: [
              const Text('sync scroll'),
              Checkbox(
                value: syncScroll,
                fillColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                onChanged: (value) {
                  setState(() {
                    syncScroll = !syncScroll;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text('show translation'),
              Checkbox(
                value: showTranslation,
                fillColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                onChanged: (value) {
                  setState(() {
                    showTranslation = !showTranslation;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? PageView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                widget.book.textEn.length,
                (index) => VerticalText(
                  syncScroll: syncScroll,
                  showTranslation: showTranslation,
                  englishText: widget.book.textEn[index],
                  ukrainianText: widget.book.textUa[index],
                ),
              ),
            )
          : Container(),
    );
  }
}
