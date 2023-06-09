import 'package:flutter/material.dart';

class CustomCheckboxReadOnly extends StatefulWidget {
   bool fieldController ;
   CustomCheckboxReadOnly({
    Key key,
    this.fieldController,

  }) : super(key: key);
  @override

  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckboxReadOnly> {
  @override
  void initState() {
    super.initState();
    _isChecked = widget.fieldController;
  }
  bool _isChecked;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        color: widget.fieldController ? Colors.blue : Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: widget.fieldController
          ? Icon(
              Icons.check,
              size: 20.0,
              color: Colors.white,
            )
          : null,
    );
  }
}
