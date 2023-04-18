// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_app/core/theme_provider.dart';

class ChangeThemeCheckBox extends StatefulWidget {
  void Function(DarkThemeProvider) onChange;
  bool value;
  ChangeThemeCheckBox({
    Key? key,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  State<ChangeThemeCheckBox> createState() => _ChangeThemeCheckBoxState();
}

class _ChangeThemeCheckBoxState extends State<ChangeThemeCheckBox> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Checkbox(
      value: widget.value,
      onChanged: (bool? value) {
        widget.onChange(themeChange);
        setState(() {
          // value = value == widget.value ? widget.value : !widget.value;
          widget.value = value ?? !widget.value;
        });
      },
    );
  }
}
