import 'package:flutter/material.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';

class UserReservationsLists extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final double wholePadding;

   UserReservationsLists({

     this.name,
     this.date,
     this.time,
    this.wholePadding = 8,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(wholePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: FormLabelText(
                  labelText: name,
                  paddingbottom: 0,
                  paddingtop: 0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
            child: Column(
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
          ),
        ],
      ),
    );
  }
}
