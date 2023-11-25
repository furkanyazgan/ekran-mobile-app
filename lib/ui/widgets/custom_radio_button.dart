import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  CustomRadioButton(
      {Key? key,
      required this.child,
      this.width,
      required this.height,
      required this.onTap,
      required this.value,
      required this.selectedColor,
      this.unSelectedColor,
      this.selectedButton = false,
      this.borderRadius = 20.0})
      : super(key: key);

  Function(dynamic, bool) onTap;
  Widget child;
  double? width;
  double height;
  Color selectedColor;
  Color? unSelectedColor;
  double borderRadius;
  dynamic value;

  bool selectedButton;

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  Color? nowColor;
  Color? splashColor;
  Color? unSelectedColor;

  @override
  void initState() {
    unSelectedColor = widget.unSelectedColor;

    if (unSelectedColor == null) {
      unSelectedColor = widget.selectedColor.withOpacity(0.5);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedButton) {
      nowColor = widget.selectedColor;
      splashColor = unSelectedColor;
    } else {
      nowColor = unSelectedColor;
      splashColor = widget.selectedColor;
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Material(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: nowColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          onTap: () {
            setState(() {

              widget.selectedButton = !widget.selectedButton;
              widget.onTap(widget.value, widget.selectedButton);
            });
          },
          splashColor: splashColor,
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
