import 'package:flutter/material.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/view/screens/contacts/contacts.dart';

class AddContact extends StatefulWidget {
  AddContact({Key key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final TextEditingController customerFullName = TextEditingController();
  final TextEditingController customerEmail = TextEditingController();
  final TextEditingController customerPhone = TextEditingController();
  final TextEditingController customerVisitType = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    customerEmail.dispose();
    customerVisitType.dispose();
    customerFullName.dispose();
    customerPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "New Contact",
        backButton: Contacts(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          'New Contact',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Type the details for your new contact',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormLabelText(
                          labelText: 'Full Name',
                        ),
                        InputField(
                          placeholderText: 'Jeronimo Ovejas Ortega',
                          fieldController: customerFullName,
                          suffixIconImage: 'assets/ListTrailingEditIcon.png',
                          suffixIconImageWidth: 5,
                          suffixIconImageHeight: 5,
                          sufficIconPadding: 15,
                        ),
                        FormLabelText(
                          labelText: 'Email',
                        ),
                        InputField(
                          placeholderText: 'jeronimo@aqcess.com',
                          fieldController: customerEmail,
                          suffixIconImage: 'assets/ListTrailingEditIcon.png',
                          suffixIconImageWidth: 5,
                          suffixIconImageHeight: 5,
                          sufficIconPadding: 15,
                        ),
                        FormLabelText(
                          labelText: 'Visit Type',
                        ),
                        InputField(
                          placeholderText: 'Familiar, Servicios, Amigo...',
                          fieldController: customerVisitType,
                          suffixIconImage: 'assets/ListTrailingEditIcon.png',
                          suffixIconImageWidth: 5,
                          suffixIconImageHeight: 5,
                          sufficIconPadding: 15,
                        ),
                        FormLabelText(
                          labelText: 'Phone',
                        ),
                        InputField(
                          placeholderText: '+52 442 6687402',
                          fieldController: customerPhone,
                          suffixIconImage: 'assets/ListTrailingEditIcon.png',
                          suffixIconImageWidth: 5,
                          suffixIconImageHeight: 5,
                          sufficIconPadding: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: Container(
              margin:  EdgeInsets.fromLTRB(16, 15, 16, 5),
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
                onPressed: () {},
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
