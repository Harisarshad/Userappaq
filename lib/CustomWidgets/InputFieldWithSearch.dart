import 'package:flutter/material.dart';

class InputFieldWithSearch extends StatefulWidget {
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
  final Function(String text) onChange;

  InputFieldWithSearch({
    Key key,
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
    this.onChange ,
  });

  @override
  State<InputFieldWithSearch> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputFieldWithSearch> {
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
          onChanged: widget.onChange,
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
        ),
      ),
    );
  }
}
