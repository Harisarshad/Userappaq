import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/CustomCheckbox.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/ImageUpload.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';

import '../../../controller/camera_screen_controller.dart';
import '../../../controller/edit_profile_controller.dart';
import '../../../data/api/api_client.dart';
import '../../../data/model/body/edit_amenty_body.dart';
import '../../../data/model/body/edit_profile_body.dart';

class CreateAmenity extends StatefulWidget {
  const CreateAmenity({Key key}) : super(key: key);

  @override
  State<CreateAmenity> createState() => _CreateAmenityState();
}

class _CreateAmenityState extends State<CreateAmenity> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController newAmenity = TextEditingController();
  final TextEditingController startTime = TextEditingController();
  final TextEditingController endTime = TextEditingController();
  final TextEditingController monday_friday = TextEditingController();
  final TextEditingController saturday = TextEditingController();
  final TextEditingController sunday = TextEditingController();
  File _pickedImage;
  @override
  void dispose() {
    newAmenity.dispose();
    startTime.dispose();
    endTime.dispose();
    monday_friday.dispose();
    saturday.dispose();
    sunday.dispose();

    super.dispose();
  }

  String imagePath = "assets/Upload.png";
  Future<void> _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        Get.find<CameraScreenController>().setImage(_pickedImage);
      });
    }
  }

  _saveProfile() {
    String _Name = newAmenity.text;
    String _startTime = startTime.text;
    String _endTime = endTime.text;

    File _image = _pickedImage;

    List<MultipartBody> _multipartBody;

    if (_image != null) {
      _multipartBody = [MultipartBody('image', _image)];
    } else {
      _multipartBody = [];
    }

    EditAmenityBody editProfileBody = EditAmenityBody(
      name: _Name,
      start: _startTime,
      end: _endTime,
    );
    Get.find<EditProfileController>()
        .updateAmentiesData(editProfileBody, _multipartBody)
        .then((value) {
      if (value) {
        Get.back();
        //Get.find<ProfileController>().profileData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            FormLabelText(
              labelText: "Create a new Amenity",
            ),
            InputField(
              placeholderText: "Type amenity name",
              fieldController: newAmenity,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                width: 400,
                height: 120,
                child: _pickedImage != null
                    ? Image.file(
                        _pickedImage,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => _openGallery(context),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 29, 113, 247),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  imagePath,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () => _openGallery(context),
                            child: RichText(
                              text: TextSpan(
                                text: 'Select the Image',
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: '',
                                    style: TextStyle(
                                        color: Colors
                                            .black26 // Replace with your desired color
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),

              // ImageUploadWidget(
              //   imagePath: "assets/Upload-blue.png",
              //   containerColor: Colors.white,
              //   backgroundColor: Color.fromARGB(255, 29, 113, 247),
              //   plainText: "Click to add ",
              //   coloredText: "image",
              //   textColor: Colors.white,
              //   inLineTextColor: Colors.white,
              // ),
            ),
            FormLabelText(labelText: "Availability"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 100,
                      //height: widget.height,
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
                            startTime.text = selectedTime.format(context);
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

                        controller: startTime,
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
                  ),
                  Container(
                    width: 100,
                    //height: widget.height,
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
                          endTime.text = selectedTime.format(context);
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

                      controller: endTime,
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

                  // InputField(
                  //   placeholderText: "11:00 PM",
                  //   fieldController: startTime,
                  //   width: 90,
                  //   fieldPaddingleft: 0,
                  //   fieldPaddingright: 10,
                  // ),
                  // InputField(
                  //   placeholderText: "7:00 PM",
                  //   fieldController: startTime,
                  //   width: 90,
                  //   fieldPaddingleft: 0,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 0, 100),
              child: Row(
                children: [
                  CustomCheckbox(fieldController: false),
                  FormLabelText(
                    labelText: "Publish Amenity",
                    paddingleft: 10,
                    paddingbottom: 0,
                    paddingright: 0,
                    paddingtop: 0,
                  )
                ],
              ),
            ),
            ButtonCustom(
              buttonText: "Save changes",
              onPress: () {
                _saveProfile();
              },
              paddingTop: 100,
            )
          ],
        ),
      )),
    );
  }
}
