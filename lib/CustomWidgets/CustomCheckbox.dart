import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Container(
        width: 32.0,
        height: 32.0,
        decoration: BoxDecoration(
          color: _isChecked ? Colors.blue : Colors.white,
          border: Border.all(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: _isChecked
            ? Icon(
                Icons.check,
                size: 20.0,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
