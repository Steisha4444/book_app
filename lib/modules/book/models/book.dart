import 'dart:convert';

class Book {
  final int id;
  final String name;
  final String author;
  final String level;
  final String description;
  final String cover;
  final List<String> textUa;
  final List<String> textEn;
  final int date;
  final int pages;
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
    required this.date,
    required this.pages,
    required this.rate,
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
      'date': date,
      'pages': pages,
      'rate': rate,
      'genres': genres,
    };
  }

  static List<String> separatePages(text) {
    // a.split(/((?:\w+ ){5})/g).filter(Boolean).join("\n");
    String formatted = text.split('*').join("\n\n");
    List<String> pages = formatted.split('\$');
    pages.removeLast();
    return pages;
  }

  Book.fromJson(Map<String, dynamic> map)
      : id = int.parse(map['bookId']),
        name = map['bookName'],
        author = map['author'],
        level = map['level'],
        description = map['description'],
        cover = map['cover'],
        textUa = separatePages(map['contextUa']),
        textEn = separatePages(map['contextEn']),
        date = map['publicationDate'],
        pages = map['pages'],
        rate = map['rating'],
        genres = List<String>.from(
          (map['genres']),
        );
}
