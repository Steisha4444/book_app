import 'package:book_app/modules/book/models/book.dart';
import 'package:book_app/modules/book/screen/book_info_screen.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      height: 180,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Material(
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookInfoScreen(
                  book: book,
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    radius: 48, // Image radius
                    backgroundImage: NetworkImage(
                      book.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          book.description,
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
