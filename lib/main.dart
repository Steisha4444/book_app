import 'package:book_app/core/app_theme.dart';
import 'package:book_app/core/theme_provider.dart';
import 'package:book_app/modules/authenticate/models/user.dart';
import 'package:book_app/services/auth.dart';
import 'package:book_app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider themeChangeProvider = DarkThemeProvider();

    bool isDarkTheme = themeChangeProvider.darkTheme;
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: StreamProvider<FirebaseUser?>.value(
        initialData: null,
        value: AuthService().user,
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            //theme: AppTheme.buildTheme(isDarkTheme, context),
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: Wrapper(),
          );
        }),
      ),
    );
  }
}
