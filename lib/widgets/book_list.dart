import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/widgets/level_switch.dart';

import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

import 'book_tile.dart';

enum Level { a2, b1, b2, c1 }

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  BooksListState createState() => BooksListState();
}

class BooksListState extends State<BooksList> {
  final TextEditingController _searchController = TextEditingController();
  Map<Level, bool> levels = {
    Level.a2: true,
    Level.b1: true,
    Level.b2: true,
    Level.c1: true,
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
    'Fiction',
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
            cursorColor: const Color.fromARGB(255, 171, 99, 99),
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
              value: levels[Level.a2]!,
              title: 'A2',
              onTap: () {
                setState(() {
                  levels[Level.a2] = !levels[Level.a2]!;
                  searchBooks(_searchController.text);
                });
              },
            ),
            LevelSwitch(
              value: levels[Level.b1]!,
              title: 'B1',
              onTap: () {
                setState(() {
                  levels[Level.b1] = !levels[Level.b1]!;
                  searchBooks(_searchController.text);
                });
              },
            ),
            LevelSwitch(
              value: levels[Level.b2]!,
              title: 'B2',
              onTap: () {
                setState(() {
                  levels[Level.b2] = !levels[Level.b2]!;
                  searchBooks(_searchController.text);
                });
              },
            ),
            LevelSwitch(
              value: levels[Level.c1]!,
              title: 'C1/C2',
              onTap: () {
                setState(() {
                  levels[Level.c1] = !levels[Level.c1]!;
                  searchBooks(_searchController.text);
                });
              },
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 155,
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
