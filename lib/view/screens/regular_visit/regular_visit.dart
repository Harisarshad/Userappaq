import 'package:flutter/material.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/CustomWidgets/UserReservationsLists.dart';

class UserReservations extends StatefulWidget {
   UserReservations({Key key}) : super(key: key);

  @override
  State<UserReservations> createState() => _UserReservationsState();
}

class _UserReservationsState extends State<UserReservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(titleText: "My Bookings",),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCustom(
                      buttonText: "New Booking",
                      onPress: () {},
                      width: MediaQuery.of(context).size.width -
                          17 -
                          MediaQuery.of(context).size.width / 2,
                      paddingRight: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      foregroundColor: AqcessColors().primary,
                    ),
                    ButtonCustom(
                      buttonText: "My Bookings",
                      onPress: () {},
                      width: MediaQuery.of(context).size.width -
                          17 -
                          MediaQuery.of(context).size.width / 2,
                      paddingRight: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      elevation: 0,
                      backgroundColor: AqcessColors().primary,
                      foregroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              color: AqcessColors().primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 80, 0),
                    child: FormLabelText(
                      labelText: "Amenity Name",
                      TextColor: Colors.white,
                      paddingtop: 0,
                      paddingbottom: 0,
                      paddingleft: 0,
                      paddingright: 0,
                    ),
                  ),
                  FormLabelText(
                    labelText: "Date and Time",
                    TextColor: Colors.white,
                    paddingtop: 0,
                    paddingbottom: 0,
                    paddingleft: 20,
                    paddingright: 0,
                  ),
                ],
              ),
            ),
            UserReservationsLists(
              name: "John Doe Sharma",
              date: "23/28/26",
              time: "10:25 Am",
              wholePadding: 12,
            ),
            Divider(),
            UserReservationsLists(
              name: "John Doe Sharma",
              date: "23/28/26",
              time: "10:25 Am",
              wholePadding: 12,
            ),
            Divider(),
            UserReservationsLists(
              name: "John Doe Sharma",
              date: "23/28/26",
              time: "10:25 Am",
              wholePadding: 12,
            ),
            Divider(),
            UserReservationsLists(
              name: "John Doe Sharma",
              date: "23/28/26",
              time: "10:25 Am",
              wholePadding: 12,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}