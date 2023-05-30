import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
  State<CustomSlider> createState() => CustomSliderState();
}

class CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        Slider(
          min: widget.min,
          max: widget.max,
          thumbColor: Theme.of(context).secondaryHeaderColor,
          inactiveColor:
              Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
          activeColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
          value: widget.value,
          onChanged: (value) {
            setState(() {
              widget.value = value;
            });
            widget.onChanged(value);
          },
        ),
        Text(
          widget.min < 1
              ? widget.value.toStringAsFixed(1)
              : widget.value.round().toString(),
        ),
      ],
    );
  }
}
