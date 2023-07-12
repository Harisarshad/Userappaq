import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  final double width;
  final double height;
  final String buttonText;
  final VoidCallback onPress;
  final Color foregroundColor;
  final Color backgroundColor;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double paddingTop;
  final double elevation;
  final double borderRadius;

  const ButtonCustom({
    Key key,
    this.width = 400,
    this.height = 50,
    this.backgroundColor = const Color.fromARGB(255, 29, 113, 247),
    this.foregroundColor = Colors.white,
    this.paddingBottom = 20,
    this.paddingLeft = 16,
    this.paddingRight = 16,
    this.paddingTop = 40,
    this.elevation = 8,
    this.borderRadius = 8,
     this.buttonText,
     this.onPress,
  }) : super(key: key);

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        widget.paddingLeft,
        widget.paddingTop,
        widget.paddingRight,
        widget.paddingBottom,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.foregroundColor, backgroundColor: widget.backgroundColor,
          elevation: widget.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
          minimumSize: Size(widget.width, widget.height),
        ),
        onPressed: widget.onPress,
        child: Text(
          widget.buttonText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
