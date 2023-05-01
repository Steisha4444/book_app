import 'package:book_app/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';

void translate(String text, context) async {
  String textUk = await translateText(text);

  showTranslation(context, text, textUk);
}

List<String> groupText(List<String> textEn) {
  List<String> wordGroups = [];
  // group text per 10 word in one array element
  int count = 10;
  for (int i = 0; i < textEn.length; i += count) {
    if (textEn.length > i) {
      wordGroups.add(
        textEn
            .sublist(i, i + count < textEn.length ? i + count : textEn.length)
            .join(' '),
      );
    }
  }
  return wordGroups;
}

Future<String> translateText(String wordGroups) async {
  final translator = GoogleTranslator(client: ClientType.extensionGT);
  Translation translate =
      await translator.translate(wordGroups, from: 'en', to: 'uk');
  String textUk = translate.text;

  return textUk;
}

void showTranslation(context, String wordGroups, String textUk) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        title: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                wordGroups,
                style: GoogleFonts.rosarivo(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                textUk,
                style: GoogleFonts.rosarivo(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

List<String> getTest(String text) {
  RegExp regex = RegExp(r'[.?!:;]+');

  // Find all matches of the regular expression in the string
  Iterable<Match> matches = regex.allMatches(text);

  // Split the string at the positions of the matches
  List<String> substrings = [];
  int index = 0;
  for (Match match in matches) {
    substrings.add(text.substring(index, match.start) + match.group(0)!);
    index = match.end;
  }
  substrings.add(text.substring(index));

  return substrings;
}
