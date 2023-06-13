import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/CustomWidgets/UserReservationsLists.dart';

import 'create_amenity.dart';

class BookedAmenities extends StatefulWidget {
  const BookedAmenities({Key key}) : super(key: key);

  @override
  State<BookedAmenities> createState() => _BookedAmenitiesState();
}

class _BookedAmenitiesState extends State<BookedAmenities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "Amenities",
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
                children: [
                  ButtonCustom(
                    buttonText: "bookings".tr,
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
                    buttonText: "create_amenity".tr,
                    onPress: () {
                      Get.to(CreateAmenity());
                    },
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
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Row(
              children: [
                FormLabelText(
                  labelText: "pool_zone".tr,
                  paddingtop: 0,
                  textWeight: FontWeight.w700,
                  paddingbottom: 0,
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset("assets/ListTrailingEditIcon.png",
                      width: 20, height: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/PoolZone.png",
                width: MediaQuery.of(context).size.width,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          FormLabelText(labelText: "active_bookings".tr,textWeight: FontWeight.w700),
          UserReservationsLists(
            name: "John Doe Sharma",
            date: "23/28/26",
            time: "10:25 Am",
            wholePadding: 12,
          ),
          Divider(),
          UserReservationsLists(
            name: "Pool 3",
            date: "23/28/26",
            time: "10:25 Am",
            wholePadding: 12,
          ),
          Divider(),
          UserReservationsLists(
            name: "12",
            date: "23/28/26",
            time: "10:25 Am",
            wholePadding: 12,
          ),
          Divider(),
          UserReservationsLists(
            name: "12",
            date: "23/28/26",
            time: "10:25 Am",
            wholePadding: 12,
          ),
          Divider(),
          UserReservationsLists(
            name: "12",
            date: "23/28/26",
            time: "10:25 Am",
            wholePadding: 12,
          ),
          Divider(),
          UserReservationsLists(
            name: "Any Text Here",
            date: "23/28/26",
            time: "10:25 Am",
            wholePadding: 12,
          ),
          Divider(),
          UserReservationsLists(
            name: "should not effect the col",
            date: "23/28/26",
            time: "10:25 Am",
            wholePadding: 12,
          ),
          Divider(),
        ]),
      ),
    );
  }
}
