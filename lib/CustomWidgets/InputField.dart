import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String placeholderText;
  final TextEditingController fieldController;
  final double width;
  final double height;
  final double fieldPaddingleft;
  final double fieldPaddingright;
  final double suffixIconImageWidth;
  final double suffixIconImageHeight;
  final double sufficIconPadding;
  final String suffixIconImage;
  final String prefixIconImage;
  final bool obscureText;
  final TextInputType keyboardType;

  InputField(
      {Key key,
      this.placeholderText,
      this.fieldController,
      this.width = double.infinity,
      this.fieldPaddingleft = 16,
      this.fieldPaddingright = 16,
      this.suffixIconImage,
      this.height = 60,
      this.prefixIconImage,
      this.suffixIconImageHeight = 20,
      this.suffixIconImageWidth = 30,
      this.sufficIconPadding = 8,
      this.obscureText = false,
      this.keyboardType = TextInputType.text});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    Widget suffixIcon;
    if (widget.suffixIconImage != null) {
      suffixIcon = Padding(
        padding: EdgeInsets.all(widget.sufficIconPadding),
        child: Image.asset(
          widget.suffixIconImage,
          width: widget.suffixIconImageWidth,
          height: widget.suffixIconImageHeight,
        ),
      );
    }

    Widget prefixIcon;
    if (widget.prefixIconImage != null && widget.prefixIconImage.isNotEmpty) {
      prefixIcon = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          widget.prefixIconImage,
          width: 30,
          height: 20,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.fieldPaddingleft,
        0,
        widget.fieldPaddingright,
        0,
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: TextFormField(
          style: TextStyle(),
          controller: widget.fieldController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This is a required field.';
            } else {
              return null;
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            fillColor: Colors.white,
            hintText: widget.placeholderText,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText, // Hides entered characters
        ),
      ),
    );
  }
}
