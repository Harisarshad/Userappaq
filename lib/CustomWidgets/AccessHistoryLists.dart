import 'package:flutter/material.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';

class AccessHistoryLists extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final double wholePadding;

  const AccessHistoryLists({
    Key key,
     this.name,
     this.date,
     this.time,
    this.wholePadding = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(wholePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 85, 0),
            child: FormLabelText(
              labelText: name,
              paddingbottom: 0,
              paddingtop: 0,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormLabelText(
                labelText: date,
                fontSize: 16,
                paddingbottom: 0,
                paddingtop: 0,
              ),
              FormLabelText(
                labelText: time,
                paddingright: 25,
                fontSize: 14,
                paddingbottom: 0,
                paddingtop: 0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
