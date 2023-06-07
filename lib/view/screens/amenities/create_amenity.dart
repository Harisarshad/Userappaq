import 'package:flutter/material.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/CustomCheckbox.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/ImageUpload.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';

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
              padding:  EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: ImageUploadWidget(
                imagePath: "assets/Upload-blue.png",
                containerColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 29, 113, 247),
                plainText: "Click to add ",
                coloredText: "image",
                textColor: Colors.white,
                inLineTextColor: Colors.white,
              ),
            ),
            FormLabelText(labelText: "Availability"),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InputField(
                    placeholderText: "Monday to Friday",
                    fieldController: monday_friday,
                    width: 150,
                    fieldPaddingright: 10,
                  ),
                  InputField(
                    placeholderText: "11:00 PM",
                    fieldController: startTime,
                    width: 90,
                    fieldPaddingleft: 0,
                    fieldPaddingright: 10,
                  ),
                  InputField(
                    placeholderText: "7:00 PM",
                    fieldController: startTime,
                    width: 90,
                    fieldPaddingleft: 0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InputField(
                    placeholderText: "Monday to Friday",
                    fieldController: saturday,
                    width: 150,
                    fieldPaddingright: 10,
                  ),
                  InputField(
                    placeholderText: "11:00 PM",
                    fieldController: startTime,
                    width: 90,
                    fieldPaddingleft: 0,
                    fieldPaddingright: 10,
                  ),
                  InputField(
                    placeholderText: "7:00 PM",
                    fieldController: startTime,
                    width: 90,
                    fieldPaddingleft: 0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InputField(
                    placeholderText: "Monday to Friday",
                    fieldController: sunday,
                    width: 150,
                    fieldPaddingright: 10,
                  ),
                  InputField(
                    placeholderText: "11:00 PM",
                    fieldController: startTime,
                    width: 90,
                    fieldPaddingleft: 0,
                    fieldPaddingright: 10,
                  ),
                  InputField(
                    placeholderText: "7:00 PM",
                    fieldController: startTime,
                    width: 90,
                    fieldPaddingleft: 0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 0, 100),
              child: Row(
                children: [
                  CustomCheckbox(fieldController:false),
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
              onPress: () {},
              paddingTop: 100,
            )
          ],
        ),
      )),
    );
  }
}
