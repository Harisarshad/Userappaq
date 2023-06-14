import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:six_cash/data/model/body/pass_body.dart';

import '../../../Constants.dart';
import '../../../CustomWidgets/CustomCheckbox.dart';
import '../../../CustomWidgets/CustomListTile.dart';

import '../../../CustomWidgets/FormLabelText.dart';
import '../../../CustomWidgets/InputField.dart';

import '../../../controller/contacts_controller.dart';
import '../../../controller/pass_controller.dart';

import '../../base/custom_snackbar.dart';

class CreatePass extends StatefulWidget {
  CreatePass({Key key}) : super(key: key);

  @override
  State<CreatePass> createState() => _CreatePassState();
}

class _CreatePassState extends State<CreatePass> {
  final TextEditingController Contacts = TextEditingController();
  final bool saveContact = false;
  final bool permanentPass = false;
  String user_id = '0';
  final TextEditingController fullName = TextEditingController();
  final TextEditingController visitingReason = TextEditingController();
  final TextEditingController passDate = TextEditingController();
  final TextEditingController passStartTime = TextEditingController();
  final TextEditingController passEndTime = TextEditingController();

  // Overriding them for initializing them
  @override
  void initState() {
    // Contacts = TextEditingController();
    // fullName = TextEditingController();
    // visitingReason = TextEditingController();
    // passDate = TextEditingController();
    // passStartTime = TextEditingController();
    // passEndTime = TextEditingController();
    Get.find<ContactsController>().getContactsData(1, reload: true);
    super.initState();
  }

  List<DateTime> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  final config = CalendarDatePicker2Config(
    selectedDayHighlightColor: Colors.amber[900],
    weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    firstDayOfWeek: 1,
    controlsHeight: 50,
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    dayTextStyle: const TextStyle(
      color: Colors.amber,
      fontWeight: FontWeight.bold,
    ),
    disabledDayTextStyle: const TextStyle(
      color: Colors.grey,
    ),
    selectableDayPredicate: (day) => !day
        .difference(DateTime.now().subtract(const Duration(days: 3)))
        .isNegative,
  );

// Dont forget to Dispose !!
  @override
  void dispose() {
    Contacts.dispose();
    fullName.dispose();
    visitingReason.dispose();
    passDate.dispose();
    passStartTime.dispose();
    passEndTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //fetching today's date
    DateTime now = DateTime.now();
    // String date = now.year.toString() +
    //     "/" +
    //     now.month.toString() +
    //     "/" +
    //     now.day.toString();

    // String date = DateTime(now.year, now.month, now.day);K
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 200,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_left_outlined,
                  ),
                ),
              ),
              Text(
                "Back",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 75, 0),
            child: Image.asset(
              "assets/navbar-logo.png",
              width: 100,
              height: 20,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Divider(color: Colors.grey),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "create_pass".tr,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "visit_details".tr,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    FormLabelText(labelText: "Select from My Contacts"),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 15, 16, 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AqcessColors().primary,
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          minimumSize: Size(400, 50),
                        ),
                        onPressed: () {
                          print(('showModalBottomSheetforcontact'));

                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return GetBuilder<ContactsController>(
                                  builder: (contactController) {
                                return ConstrainedBox(
                                  constraints:
                                      contactController.contactList.length > 0
                                          ? BoxConstraints(
                                              maxHeight: contactController
                                                      .contactList.length
                                                      .toDouble() *
                                                  100)
                                          : BoxConstraints(
                                              maxHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          contactController.contactList.length,
                                      itemBuilder: (ctx, index) {
                                        return InkWell(
                                          onTap: () {
                                            fullName.text = contactController
                                                .contactList[index].userName;
                                            user_id = contactController
                                                .contactList[index].id;
                                            Navigator.pop(context);
                                          },
                                          child: CustomListTile(
                                              cont: contactController
                                                  .contactList[index],
                                              userName: contactController
                                                  .contactList[index].userName,
                                              userEmail: contactController
                                                  .contactList[index].email,
                                              imagePath: "assets/Person1.png",
                                              edit: false),
                                        );
                                      }),
                                );
                                // child: ContactView(transactionType: 'cash_outs', contactController: contactController));
                              });
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "Select Contact",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Image.asset(
                                  'assets/Contact-Pass.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextWithDividers(text: "visitor_info".tr),
                    FormLabelText(labelText: "Full Name"),
                    InputField(
                      placeholderText: "visitor_fullname".tr,
                      fieldController: fullName,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 5, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCheckbox(fieldController: saveContact),
                          FormLabelText(labelText: "save_contact".tr),
                        ],
                      ),
                    ),
                    FormLabelText(labelText: "visit_reason".tr),
                    InputField(
                      placeholderText: "visit_reason_placeholder".tr,
                      fieldController: visitingReason,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 5, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCheckbox(fieldController: permanentPass),
                          FormLabelText(labelText: "permanent_pass".tr),
                        ],
                      ),
                    ),
                    FormLabelText(labelText: "date".tr),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: TextFormField(
                              onTap: () async {
                                var results =
                                    await showCalendarDatePicker2Dialog(
                                  context: context,
                                  config:
                                      CalendarDatePicker2WithActionButtonsConfig(),
                                  dialogSize: const Size(325, 400),
                                  value: _singleDatePickerValueWithDefaultValue,
                                  borderRadius: BorderRadius.circular(15),
                                );
                                print(results);
                                passDate.text = results.isNotEmpty
                                    ? results
                                        .map((v) => v
                                            .toString()
                                            .replaceAll('00:00:00.000', ''))
                                        .join(', ')
                                    : 'null';
                                print(passDate.text);

                                // showModalBottomSheet(
                                //   context: context,
                                //   builder: (context) {
                                //     return CalendarDatePicker2(
                                //
                                //       config: CalendarDatePicker2Config(),
                                //       value: _singleDatePickerValueWithDefaultValue,
                                //       onValueChanged: (dates) => {
                                //         _singleDatePickerValueWithDefaultValue = dates,
                                //         print(dates),
                                //
                                //         passDate.text = dates.isNotEmpty
                                //             ? dates
                                //             .map((v) => v.toString().replaceAll('00:00:00.000', ''))
                                //             .join(', ')
                                //             : 'null',
                                //       }
                                //       //passDate.text =dates.da
                                //       ,
                                //     );
                                //   },
                                // ),
                              },
                              readOnly: true,
                              style: TextStyle(),
                              controller: passDate,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This is a required field.';
                              //   } else {
                              //     return null;
                              //   }
                              // },
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
                                hintText: 'Date',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Container(
                                  child: FormLabelText(
                                      labelText: "start_time".tr)),
                            ),
                            Container(
                              width: 175,
                              child: TextFormField(
                                onTap: () async {
                                  TimeOfDay initialTime = TimeOfDay.now();
                                  TimeOfDay pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: initialTime,
                                  );
                                  //   var results = await showCalendarDatePicker2Dialog(
                                  //   context: context,
                                  //   config: CalendarDatePicker2WithActionButtonsConfig(),
                                  //   dialogSize: const Size(325, 400),
                                  //   value: _singleDatePickerValueWithDefaultValue,
                                  //   borderRadius: BorderRadius.circular(15),
                                  // );
                                  setState(() {
                                    TimeOfDay selectedTime = pickedTime;
                                    passStartTime.text =
                                        selectedTime.format(context);
                                  });

                                  // showModalBottomSheet(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return CalendarDatePicker2(
                                  //
                                  //       config: CalendarDatePicker2Config(),
                                  //       value: _singleDatePickerValueWithDefaultValue,
                                  //       onValueChanged: (dates) => {
                                  //         _singleDatePickerValueWithDefaultValue = dates,
                                  //         print(dates),
                                  //
                                  //         passDate.text = dates.isNotEmpty
                                  //             ? dates
                                  //             .map((v) => v.toString().replaceAll('00:00:00.000', ''))
                                  //             .join(', ')
                                  //             : 'null',
                                  //       }
                                  //       //passDate.text =dates.da
                                  //       ,
                                  //     );
                                  //   },
                                  // ),
                                },
                                readOnly: true,
                                style: TextStyle(),

                                controller: passStartTime,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This is a required field.';
                                //   } else {
                                //     return null;
                                //   }
                                // },
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
                                  hintText: '12:00',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            ),
                            // DropdownInputField(
                            //   placeholder: "12:00",
                            //   controller: passStartTime,
                            //   width: 175,
                            //   values: ['12:00', '12:00', '12:00', '12:00'],
                            // ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Container(
                                  child:
                                      FormLabelText(labelText: "end_time".tr)),
                            ),
                            Container(
                              width: 175,
                              child: TextFormField(
                                onTap: () async {
                                  TimeOfDay initialTime = TimeOfDay.now();
                                  TimeOfDay pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: initialTime,
                                  );
                                  //   var results = await showCalendarDatePicker2Dialog(
                                  //   context: context,
                                  //   config: CalendarDatePicker2WithActionButtonsConfig(),
                                  //   dialogSize: const Size(325, 400),
                                  //   value: _singleDatePickerValueWithDefaultValue,
                                  //   borderRadius: BorderRadius.circular(15),
                                  // );

                                  setState(() {
                                    TimeOfDay selectedTime = pickedTime;
                                    passEndTime.text =
                                        selectedTime.format(context);
                                  });

                                  // showModalBottomSheet(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return CalendarDatePicker2(
                                  //
                                  //       config: CalendarDatePicker2Config(),
                                  //       value: _singleDatePickerValueWithDefaultValue,
                                  //       onValueChanged: (dates) => {
                                  //         _singleDatePickerValueWithDefaultValue = dates,
                                  //         print(dates),
                                  //
                                  //         passDate.text = dates.isNotEmpty
                                  //             ? dates
                                  //             .map((v) => v.toString().replaceAll('00:00:00.000', ''))
                                  //             .join(', ')
                                  //             : 'null',
                                  //       }
                                  //       //passDate.text =dates.da
                                  //       ,
                                  //     );
                                  //   },
                                  // ),
                                },
                                readOnly: true,
                                style: TextStyle(),

                                controller: passEndTime,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This is a required field.';
                                //   } else {
                                //     return null;
                                //   }
                                // },
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
                                  hintText: '12:00',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            ),
                            // DropdownInputField(
                            //   placeholder: "12:00",
                            //   controller: passEndTime,
                            //   width: 175,
                            //   values: ["1200", "12:00", "12:00", "12:00"],
                            // ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 15, 16, 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AqcessColors().primary,
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          minimumSize: Size(400, 50),
                        ),
                        onPressed: () {
                          // final TextEditingController Contacts= TextEditingController();
                          // final TextEditingController fullName= TextEditingController();
                          // final TextEditingController visitingReason= TextEditingController();
                          // final TextEditingController passDate= TextEditingController();
                          // final TextEditingController passStartTime= TextEditingController();
                          // final TextEditingController passEndTime= TextEditingController();
                          // if(Contacts.text.isEmpty  || Contacts.text.isEmpty){
                          //   showCustomSnackBar('enter_contact_pin'.tr, isError: true);
                          // }
                          if (fullName.text.isEmpty || fullName.text.isEmpty) {
                            showCustomSnackBar('enter_fullname_pin'.tr,
                                isError: true);
                          } else if (visitingReason.text.isEmpty ||
                              visitingReason.text.isEmpty) {
                            showCustomSnackBar('enter_reason_pin'.tr,
                                isError: true);
                          } else if (passDate.text.isEmpty ||
                              passDate.text.isEmpty) {
                            showCustomSnackBar('enter_passDate_pin'.tr,
                                isError: true);
                          } else if (passStartTime.text.isEmpty ||
                              passStartTime.text.isEmpty) {
                            showCustomSnackBar('enter_passStartTime_pin'.tr,
                                isError: true);
                          } else if (passEndTime.text.isEmpty ||
                              passEndTime.text.isEmpty) {
                            showCustomSnackBar('enter_passEndTime_pin'.tr,
                                isError: true);
                          } else {
                            String _passEndTime = passEndTime.text;
                            String _Contacts = Contacts.text;
                            String _passStartTime = passStartTime.text;
                            String _fullName = fullName.text;
                            int _saveContact = saveContact == true ? 1 : 0;
                            int _permanent = permanentPass == true ? 1 : 0;
                            String _visitingReason = visitingReason.text;
                            String _passDate = passDate.text;

                            print(_passDate);
                            print('_passDate');
                            print(_passDate);
                            PassBody signUpBody = PassBody(
                              fullName: _fullName,
                              reason: _visitingReason,
                              permanent: _permanent,
                              save: _saveContact,
                              userId: user_id,
                              date: _passDate,
                              phone: _Contacts,
                              startDate: _passStartTime,
                              endDate: _passEndTime,
                            );

                            Get.find<PassController>()
                                .registration(signUpBody, context)
                                .then((value) {
                              print(value.body);
                              print('harisarshad');
                              if (value.status == 200) {}
                            });

                            // Get.find<ScreenShootWidgetController>().qrCodeDownloadAndShare(qrCode: Get.find<ProfileController>().userInfo.qrCode, phoneNumber: Get.find<ProfileController>().userInfo.phone,isShare: true)
                          }
                        },
                        child: Text(
                          "create_pass".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextWithDividers extends StatelessWidget {
  final String text;
  final double dividerThickness;
  final Color dividerColor;
  final TextStyle textStyle;

  TextWithDividers({
    Key key,
    this.text,
    this.dividerThickness = 1.0,
    this.dividerColor = Colors.grey,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: dividerThickness,
          ),
        ),
        FormLabelText(
          labelText: text,
          paddingbottom: 0,
          paddingleft: 5,
          paddingright: 5,
          paddingtop: 0,
        ),
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: dividerThickness,
          ),
        ),
      ],
    );
  }
}
