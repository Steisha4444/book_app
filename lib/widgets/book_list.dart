import 'package:book_app/modules/book/models/book.dart';

import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

import 'book_tile.dart';

enum Level { A2, B1, B2, C1 }

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final TextEditingController _searchController = TextEditingController();
  Map<Level, bool> levels = {
    Level.A2: true,
    Level.B1: true,
    Level.B2: true,
    Level.C1: true,
  };

  late List<Book> books;
  late List<Book> allBooks;
  List<String> genres = [
    'Detective',
    'Psychological',
    'Ironic',
    'Parable',
    'Fiction',
    'Adventure',
    'Fantastic Fiction',
    'Contemporary' //realism
  ];
  List<String> selectedGenres = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    allBooks = Provider.of<List<Book>?>(context) ?? [];

    setState(() {
      books = allBooks;
    });
  }

  void searchBooks(String searchText) {
    List<Book> result = allBooks;
    if (levels.containsValue(false)) {
      result = allBooks.where((book) => levels[book.level]!).toList();
    }
    if (selectedGenres.isNotEmpty) {
      result = result.where((book) {
        var set = Set.of(book.genres);

        return set.containsAll(selectedGenres);
      }).toList();
    }
    if (_searchController.text.isNotEmpty) {
      result = result
          .where((book) =>
              book.author.toLowerCase().contains(searchText.toLowerCase()) ||
              book.name.toLowerCase().contains(searchText.toLowerCase()) ||
              book.description.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    setState(() {
      books = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          margin: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              searchBooks(value);
            },
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            controller: _searchController,
            cursorColor: Color.fromARGB(255, 171, 99, 99),
            decoration: InputDecoration(
              hintText: 'Search...',
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    books = allBooks;
                  });
                },
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.0, color: Theme.of(context).secondaryHeaderColor),
                borderRadius: BorderRadius.circular(12.0),
              ),
              // Add a search icon or button to the search bar
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).secondaryHeaderColor),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        Row(
          children: [
            LevelSwitch(
              value: levels[Level.A2]!,
              title: 'A2',
              onTap: () {
                setState(() {
                  levels[Level.A2] = !levels[Level.A2]!;
                  searchBooks(_searchController.text);
                });
              },
            ),
            LevelSwitch(
              value: levels[Level.B1]!,
              title: 'B1',
              onTap: () {
                setState(() {
                  levels[Level.B1] = !levels[Level.B1]!;
                  searchBooks(_searchController.text);
                });
              },
            ),
            LevelSwitch(
              value: levels[Level.B2]!,
              title: 'B2',
              onTap: () {
                setState(() {
                  levels[Level.B2] = !levels[Level.B2]!;
                  searchBooks(_searchController.text);
                });
              },
            ),
            LevelSwitch(
              value: levels[Level.C1]!,
              title: 'C1/C2',
              onTap: () {
                setState(() {
                  levels[Level.C1] = !levels[Level.C1]!;
                  searchBooks(_searchController.text);
                });
              },
            ),
            const SizedBox(width: 10),
            Container(
              width: 170,
              child: DropDownMultiSelect(
                whenEmpty: 'Select your favorite genre',
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).secondaryHeaderColor),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                hintStyle: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
                options: genres,
                selectedValues: selectedGenres,
                onChanged: (value) {
                  setState(() {
                    selectedGenres = value;
                  });
                  searchBooks(_searchController.text);
                },
              ),
            ),
          ],
        ),
        books.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return BookTile(book: books[index]);
                  },
                ),
              )
            : Center(
                child: Text(
                  'Nothing have been found',
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20),
                ),
              )
      ],
    );
  }
}

class LevelSwitch extends StatelessWidget {
  LevelSwitch({
    super.key,
    required this.value,
    required this.onTap,
    required this.title,
  });

  final bool value;
  final String title;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        Switch(
            activeColor: Theme.of(context).secondaryHeaderColor,
            activeTrackColor:
                Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
            inactiveThumbColor: Theme.of(context).cardColor,
            inactiveTrackColor: Theme.of(context).highlightColor,
            splashRadius: 50.0,
            // boolean variable value
            value: value,
            // changes the state of the switch
            onChanged: (value) {
              onTap();
            }),
      ],
    );
  }
}
