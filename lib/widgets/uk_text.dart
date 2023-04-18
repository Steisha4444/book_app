import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UkText extends StatelessWidget {
  const UkText(
      {super.key,
      required this.showTranslation,
      required this.syncScroll,
      required this.scrollController,
      required this.ukrainianText});
  final bool showTranslation;
  final bool syncScroll;
  final ScrollController scrollController;
  final String ukrainianText;

  @override
  Widget build(BuildContext context) {
    return showTranslation
        ? Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: syncScroll
                  ? (ScrollNotification scrollInfo) {
                      scrollController.jumpTo(scrollInfo.metrics.pixels);
                      return false;
                    }
                  : null,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      ukrainianText,
                      style: GoogleFonts.arsenal(
                        fontSize: 16,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox(height: 2);
  }
}
