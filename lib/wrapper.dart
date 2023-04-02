import 'package:book_app/modules/authenticate/models/user.dart';
import 'package:book_app/modules/authenticate/screen/authenticate.dart';
import 'package:book_app/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
