import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  LoginFormField({super.key, required this.onChange});

  final void Function(String) onChange;
  final TextEditingController _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _loginController,
      style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      cursorColor: Theme.of(context).secondaryHeaderColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).highlightColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).cardColor,
          ),
        ),
        hoverColor: Theme.of(context).hintColor,
        labelText: 'email',
        labelStyle: TextStyle(
          color: Theme.of(context).splashColor,
        ),
      ),
      validator: (val) => val ?? 'Enter an email',
      onChanged: (val) => onChange(val),
    );
  }
}
