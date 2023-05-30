// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

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
