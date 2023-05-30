import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key, required this.onChange});
  final void Function(String) onChange;
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _passwordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      cursorColor: Theme.of(context).secondaryHeaderColor,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () {
            // Update the state i.e. toggle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
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
        labelText: 'password',
        labelStyle: TextStyle(
          color: Theme.of(context).splashColor,
        ),
      ),
      obscureText: _passwordVisible,
      validator: (val) =>
          val!.length < 6 ? 'Enter a password 6+ chars long' : null,
      onChanged: (val) => widget.onChange(val),
    );
  }
}
