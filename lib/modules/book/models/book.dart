class Book {
  final int id;
  final String name;
  final String author;
  final String level;
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
    // a.split(/((?:\w+ ){5})/g).filter(Boolean).join("\n");
    String formatted = text.split('*').join("\n\n");
    List<String> pages = formatted.split('\$');
    pages.removeLast();
    return pages;
  }

  // static String? formatText(String? text) {
  //   if (text == null) return text;
  //   String formatted = text.split('/((?:\w+ ){5})/g').join("\n");

  //   return formatted;
  // }

  Book.fromJson(Map<String, dynamic> map)
      : id = int.parse(map['bookId'] ?? map['id']),
        name = map['bookName'],
        author = map['author'],
        level = map['level'],
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
