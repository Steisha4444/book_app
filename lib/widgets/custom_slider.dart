// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:book_app/core/app_theme.dart';

class CustomSlider extends StatefulWidget {
  double value;
  double min;
  double max;
  String title;
  final Function(double) onChanged;
  CustomSlider({
    Key? key,
    required this.value,
    required this.min,
    required this.max,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        Slider(
          min: widget.min,
          max: widget.max,
          thumbColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).primaryColor,
          activeColor: Theme.of(context).primaryColor,
          value: widget.value,
          onChanged: (value) {
            setState(() {
              widget.value = value;
            });
            widget.onChanged(value);
          },
        ),
        Text(
          widget.value.round().toString(),
        ),
      ],
    );
  }
}
