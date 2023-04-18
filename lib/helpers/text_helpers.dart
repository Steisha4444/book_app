import 'package:book_app/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';

void translate(String text, context) async {
  List<String> textEn = text.split(' ');
  List<String> wordGroups = [];
  wordGroups = groupText(textEn);
  List<String> textUk = await translateText(wordGroups);

  showTranslation(context, wordGroups, textUk);
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

Future<List<String>> translateText(List<String> wordGroups) async {
  final translator = GoogleTranslator();
  List<String> textUk = [];
  for (int i = 0; i < wordGroups.length; i++) {
    Translation translation =
        await translator.translate(wordGroups[i], from: 'en', to: 'uk');
    textUk.add(translation.text);
  }
  return textUk;
}

void showTranslation(context, List<String> wordGroups, List<String> textUk) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          children: [
            Text(
              wordGroups.join(' '),
              style: GoogleFonts.rosarivo(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              textUk.join(' '),
              style: GoogleFonts.rosarivo(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
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
