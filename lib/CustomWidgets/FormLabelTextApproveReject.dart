import 'package:flutter/material.dart';

class FormLabelText extends StatelessWidget {
  final String labelText;
  final double paddingleft;
  final double paddingright;
  final double paddingtop;
  final double paddingbottom;
  final double fontSize;
  final Color TextColor;
  final FontWeight textWeight;

  const FormLabelText(
      {Key key,
       this.labelText,
      this.paddingleft = 16,
      this.paddingtop = 10,
      this.paddingright = 0,
      this.paddingbottom = 3,
      this.TextColor = Colors.black,
      this.fontSize = 18,
      this.textWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.start, // Aligns children to the start (left)
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              paddingleft, paddingtop, paddingright, paddingbottom),
          child: Text(
            labelText,
            style: TextStyle(
                fontSize: fontSize, color: TextColor, fontWeight: textWeight),
          ),
        ),
      ],
    );
  }
}
