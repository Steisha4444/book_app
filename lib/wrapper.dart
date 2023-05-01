import 'package:book_app/core/theme_provider.dart';
import 'package:book_app/modules/authenticate/models/user.dart';
import 'package:book_app/modules/authenticate/screen/authenticate.dart';
import 'package:book_app/modules/home/books_screen.dart';
import 'package:book_app/modules/home/english_books_screen.dart';
import 'package:book_app/services/auth.dart';
import 'package:book_app/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthService _auth = AuthService();

  void changePage(int page) {
    setState(() {
      currentIndex = page;
    });
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  int currentIndex = 0;

  static final screens = [
    Books(),
    EnglishBooks(),
  ];
  static final PageController _pageController = PageController(initialPage: 0);
  void changeTheme(DarkThemeProvider themeChange) {
    themeChange.darkTheme = !themeChange.darkTheme;
    debugPrint('Theme changed');
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final user = Provider.of<FirebaseUser?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Books List',
          ),
          leading: InkWell(
            child: Icon(
              Icons.tungsten_outlined,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            onTap: () {
              changeTheme(themeChange);
            },
          ),
          backgroundColor: Theme.of(context).cardColor,
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).cardColor.withAlpha(10),
              ),
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          children: screens,
          onPageChanged: (page) {
            setState(
              () {
                currentIndex = page;
              },
            );
          },
        ),
        bottomNavigationBar: CustomNavigationBar(
          changePage: changePage,
          selectedIndex: currentIndex,
        ),
      );
    }
  }
}
