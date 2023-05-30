import 'package:book_app/core/theme_provider.dart';
import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/widgets/custom_slider.dart';
import 'package:book_app/widgets/text_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AutoTranslatingText extends StatefulWidget {
  const AutoTranslatingText({super.key, required this.book});
  final Book book;

  @override
  State<AutoTranslatingText> createState() => _AutoTranslatingTextState();
}

class _AutoTranslatingTextState extends State<AutoTranslatingText> {
  late int pageCount;
  late List<String> pageText;
  double fontSize = 16;
  double letterSpacing = 0.4;

  void testFormatting(String text) {
    var deviceData = MediaQuery.of(context);
    var deviceHeight = deviceData.size.height - 90;
    var deviceWidth =
        deviceData.size.width - 62; // 60 - AppBar estimated height
    var deviceDimension = deviceHeight * deviceWidth;

    int pageCharLimit =
        (deviceDimension / (fontSize * (fontSize * 1.19))).round();
    debugPrint('Character limit per page: $pageCharLimit');

    pageCount = (text.length / pageCharLimit).round();
    debugPrint('Pages: $pageCount');
    pageText = [];
    var index = 0;
    var startStrIndex = 0;
    var endStrIndex = pageCharLimit;

    while (index < pageCount) {
      // Update the last index to the Document Text length
      if (index == pageCount - 1) endStrIndex = text.length;
      // Add String on List<String>
      pageText.add(
        text.substring(startStrIndex, endStrIndex),
      );
      if (index < pageCount) {
        // Update index of Document Text String to be added on [pageText]
        startStrIndex = endStrIndex;
        endStrIndex += pageCharLimit;
      }
      index++;
    }
  }

  void changeFontSize(double value) {
    setState(() {
      fontSize = value;
    });
    testFormatting(widget.book.text!);
  }

  void changeLetterSpacing(double value) {
    setState(() {
      letterSpacing = value;
    });
  }

  void changeTheme(DarkThemeProvider themeChange) {
    themeChange.darkTheme = !themeChange.darkTheme;
    debugPrint('Theme changed');
  }

  int _currentPage = 1;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    testFormatting(widget.book.text!);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.name),
        backgroundColor: Theme.of(context).cardColor,
        actions: [
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
                    max: 5,
                    onChanged: changeLetterSpacing,
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: InkWell(
                    child: Row(
                      children: const [
                        Text('Change Theme '),
                        SizedBox(width: 10),
                        Icon(Icons.tungsten_outlined),
                      ],
                    ),
                    onTap: () {
                      changeTheme(themeChange);
                    },
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 38, top: 8, left: 8, right: 8),
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            _currentPage = value + 1;
            setState(() {});
          },
          children: List.generate(
            pageCount,
            (index) {
              return TextPage(
                letterSpacing: letterSpacing,
                text: pageText[index],
                fontSize: fontSize,
              );
            },
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          '      Page $_currentPage',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
      ),
    );
  }
}
