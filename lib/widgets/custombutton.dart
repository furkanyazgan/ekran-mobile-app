

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton( {Key? key, required this.child,required this.width  ,required this.height, required this.onTap, this.color=Colors.white ,this.animationColor , this.borderRadius=20.0 } )
      : super(key: key);

  Function onTap;
  Widget child;
  double width;
  double height;
  Color color ;
  Color? animationColor;
  double borderRadius;

  @override
  _CustomButtonState createState() => _CustomButtonState();


}

class _CustomButtonState extends State<CustomButton> {
  @override
  void initState() {
  if (widget.animationColor == null){
    nowColor = widget.color.withOpacity(0.5);
  }
  else{
    nowColor = widget.animationColor;
  }
    super.initState();
  }
  Color? nowColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Material(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.color,
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          onTap: () {
            widget.onTap();
          },
          onTapDown: (a) {
            nowColor = Colors.white;
            setState(() {});
          },
          onTapUp: (a) {
            nowColor = widget.animationColor;
            setState(() {});
          },
          onTapCancel: () {
            nowColor = widget.animationColor;
            setState(() {});
          },
          splashColor: Colors.transparent,
          highlightColor: widget.animationColor,
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
