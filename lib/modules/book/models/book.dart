import 'package:book_app/widgets/book_list.dart';

class Book {
  final int id;
  final String name;
  final String author;
  final Level level;
  final String description;
  final String cover;
  final List<String> textUa;
  final List<String> textEn;
  final String? text;
  final num rate;
  final List<String> genres;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.level,
    required this.description,
    required this.cover,
    required this.textUa,
    required this.textEn,
    required this.rate,
    this.text,
    required this.genres,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'author': author,
      'level': level,
      'description': description,
      'cover': cover,
      'textUa': textUa,
      'textEn': textEn,
      'text': text,
      'rate': rate,
      'genres': genres,
    };
  }

  static List<String> separatePages(String text) {
    if (text.isEmpty) return [];
    String formatted = text.split('*').join("\n\n");
    List<String> pages = formatted.split('\$');
    pages.removeLast();
    return pages;
  }

  static Level getLevel(String text) {
    switch (text) {
      case "A2":
        return Level.A2;
      case "B1":
        return Level.B1;
      case "B2":
        return Level.B2;
      case "C1":
        return Level.C1;
      case "C2":
        return Level.C1;
      default:
        return Level.B2;
    }
  }

  Book.fromJson(Map<String, dynamic> map)
      : id = int.parse(map['bookId'] ?? map['id']),
        name = map['bookName'],
        author = map['author'],
        level = getLevel(map['level']),
        description = map['description'],
        cover = map['cover'],
        textUa = separatePages(map['contextUa'] ?? ''),
        textEn = separatePages(map['contextEn'] ?? ''),
        text = map['text'],
        rate = map['rating'],
        genres = List<String>.from(
          (map['genres']),
        );
}
