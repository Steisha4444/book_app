import 'package:book_app/core/app_theme.dart';
import 'package:book_app/widgets/uk_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalText extends StatelessWidget {
  VerticalText({
    super.key,
    required this.englishText,
    required this.ukrainianText,
    required this.syncScroll,
    required this.showTranslation,
  });
  final String englishText;
  final String ukrainianText;
  final bool syncScroll;
  final bool showTranslation;

  late final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Text(
                      englishText,
                      style: GoogleFonts.arsenal(
                        fontSize: 16,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 10,
              indent: 0.6,
              height: 40,
              color: Theme.of(context).cardColor,
            ),
            UkText(
              scrollController: _scrollController,
              ukrainianText: ukrainianText,
              syncScroll: syncScroll,
              showTranslation: showTranslation,
            )
          ],
        ),
      ),
    );
  }
}
