// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  int selectedIndex;
  void Function(int) changePage;
  CustomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.changePage,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).highlightColor,
      selectedItemColor: Theme.of(context).secondaryHeaderColor,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).secondaryHeaderColor,
      ),
      selectedFontSize: 12,
      unselectedIconTheme: IconThemeData(
          color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5)),
      unselectedItemColor:
          Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
      currentIndex: selectedIndex,
      onTap: changePage,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book,
          ),
          label: 'Parallel Translate Books',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu_book,
          ),
          label: 'Dynamic Translate Books',
        ),
      ],
    );
  }
}
