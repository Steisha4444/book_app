import 'package:book_app/core/app_theme.dart';
import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/widgets/custom_slider.dart';
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
  double fontSize = 16;
  double letterSpacing = 0.4;

  void changeFontSize(double value) {
    setState(() {
      fontSize = value;
    });
  }

  void changeLetterSpacing(double value) {
    setState(() {
      letterSpacing = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).cardColor,
        title: Text(widget.book.name),
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
          PopupMenuButton(
              icon: const Icon(Icons.my_library_books_sharp),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<double>(
                    child: CustomSlider(
                      title: 'Font size',
                      value: fontSize,
                      min: 12,
                      max: 50,
                      onChanged: changeFontSize,
                    ),
                  ),
                  PopupMenuItem<int>(
                    child: Divider(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  PopupMenuItem<double>(
                    child: CustomSlider(
                      title: 'Letter spacing',
                      value: letterSpacing,
                      min: 0.1,
                      max: 3,
                      onChanged: changeLetterSpacing,
                    ),
                  ),
                ];
              })
        ],
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? PageView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                widget.book.textEn.length,
                (index) => VerticalText(
                  fontSize: fontSize,
                  letterSpacing: letterSpacing,
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
