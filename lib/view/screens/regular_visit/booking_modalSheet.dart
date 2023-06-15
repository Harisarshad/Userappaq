import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/DropDownInputField.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';

import '../../../CustomWidgets/FormLabelTextApproveReject.dart';
import '../../../controller/amenties_controller.dart';

Future<dynamic> bookingBottomSheet({
  BuildContext context,
  @required String id,
  @required TextEditingController bookingDate,
  @required TextEditingController startTime,
  @required TextEditingController endTime,
}) {
  return showModalBottomSheet(
      context: context,
      //backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  "New Booking",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            ),
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
            ButtonCustom(
                buttonText: "Book Now",
                onPress: () {
                  if (startTime.text == null) {
                    showCustomSnackBar('startTimeReqiured'.tr, isError: true);
                  } else if (endTime.text == null) {
                    showCustomSnackBar('endTimeReqiured'.tr, isError: true);
                  } else if (bookingDate.text == null) {
                    showCustomSnackBar('bookingDateRequired'.tr, isError: true);
                  }else {

                  Get.find<AmenitiesController>().bookAmenity(id,
                      bookingDate.text, startTime.text, endTime.text, context);
                  }


                })
          ],
        );
      });
}
