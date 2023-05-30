import 'package:flutter/material.dart';

class DropdownInputField extends StatefulWidget {
  final List<String> values;
  final double width;
   final TextEditingController controller;
  final String placeholder;

   DropdownInputField({
    Key key,
     this.values,
     this.controller,
     this.placeholder,
    this.width = 200.0,
  }) : super(key: key);

  @override
  _DropdownInputFieldState createState() => _DropdownInputFieldState();
}

class _DropdownInputFieldState extends State<DropdownInputField> {
  String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.values.contains(widget.controller.text) ? widget.controller.text : null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Container(
        width: widget.width,
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });
            widget.controller.text = newValue ?? '';
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            hintText: widget.placeholder,
          ),
          items: widget.values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
