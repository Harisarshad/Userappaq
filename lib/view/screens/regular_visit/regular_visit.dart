import 'package:flutter/material.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/DropDownInputField.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/CustomWidgets/UserReservationsLists.dart';

class UserReservations extends StatefulWidget {
  UserReservations({Key key}) : super(key: key);

  @override
  State<UserReservations> createState() => _UserReservationsState();
}

class _UserReservationsState extends State<UserReservations> {
  bool switchButton;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController bookingDate = TextEditingController();
  final TextEditingController startTime = TextEditingController();
  final TextEditingController endTime = TextEditingController();

  @override
  void initState() {
    super.initState();
    switchButton = false;
  }

  @override
  void dispose() {
    bookingDate.dispose();
    startTime.dispose();
    endTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "My Bookings",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
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
                      onPress: () {
                        setState(() {
                          switchButton = true;
                        });
                      },
                      width: MediaQuery.of(context).size.width -
                          17 -
                          MediaQuery.of(context).size.width / 2,
                      paddingRight: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      elevation: 0,
                      backgroundColor:
                          switchButton ? AqcessColors().primary : Colors.white,
                      foregroundColor:
                          switchButton ? Colors.white : AqcessColors().primary,
                    ),
                    ButtonCustom(
                      buttonText: "My Bookings",
                      onPress: () {
                        setState(() {
                          switchButton = false;
                        });
                      },
                      width: MediaQuery.of(context).size.width -
                          17 -
                          MediaQuery.of(context).size.width / 2,
                      paddingRight: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      elevation: 0,
                      backgroundColor:
                          switchButton ? Colors.white : AqcessColors().primary,
                      foregroundColor:
                          switchButton ? AqcessColors().primary : Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            switchButton ? Column(
              children: [

FormLabelText(
              labelText: "Select the amenity you wish to book",
              fontSize: 16,
            ),
            FormLabelText(
              labelText: "Pool Zone",
              textWeight: FontWeight.w900,
              paddingbottom: 0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/PoolZone.png",
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  FormLabelText(labelText: "Booking date"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropdownInputField(
                        values: ["12-02-2023", "01-01-05"],
                        controller: bookingDate,
                        placeholder: "02-01-2023",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Container(
                              child: FormLabelText(labelText: "Start time"),
                            ),
                          ),
                          DropdownInputField(
                            placeholder: "12:00 PM",
                            controller: startTime,
                            width: 175,
                            values: ['12:00', '12:00', '12:00', '12:00'],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Container(
                              child: FormLabelText(labelText: "End time"),
                            ),
                          ),
                          DropdownInputField(
                            placeholder: "12:00 PM",
                            controller: endTime,
                            width: 175,
                            values: ["1200", "12:00", "12:00", "12:00"],
                          ),
                        ],
                      )
                    ],
                  ),
                  ButtonCustom(buttonText: "Book Now", onPress: () {})
                ],
              ),
            )
              ],
            ): Column(
              children: [
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
            ) ,
          ],
        ),
      ),
    );
  }
}

class BookAreas extends StatefulWidget {
  const BookAreas({Key key}) : super(key: key);

  @override
  State<BookAreas> createState() => _BookAreasState();
}

class _BookAreasState extends State<BookAreas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "Book Amenity",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
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
                      backgroundColor: AqcessColors().primary,
                      foregroundColor: Colors.white,
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
                      backgroundColor: Colors.white,
                      foregroundColor: AqcessColors().primary,
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}





