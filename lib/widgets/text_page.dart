import 'package:book_app/helpers/text_helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextPage extends StatelessWidget {
  final String text;
  final double fontSize;
  final double letterSpacing;
  const TextPage(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    List<String> pageText = getTest(text);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < pageText.length; i++)
                GestureDetector(
                  onLongPress: () {
                    translate(pageText[i], context);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: pageText[i].split(' ').map((word) {
                        return TextSpan(
                          text: '$word ',
                          style: GoogleFonts.rosarivo(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: fontSize,
                            letterSpacing: letterSpacing,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              translate(word, context);
                            },
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
