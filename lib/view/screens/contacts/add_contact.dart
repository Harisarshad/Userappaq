import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/view/screens/contacts/contacts.dart';

import '../../../controller/pass_controller.dart';
import '../../../data/model/body/pass_body.dart';
import '../../../data/model/contact_model.dart';

class AddContact extends StatefulWidget {
  final ContactsData cont;
  final bool update;
  AddContact({Key key, this.cont, this.update}) : super(key: key);

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
    if(widget.update)
      {
        customerFullName.text = widget.cont.userName;
        customerEmail.text = widget.cont.email;
        customerPhone.text = widget.cont.phone;
        customerVisitType.text = widget.cont.visitType;

      }
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
        titleText: "new_contact".tr,
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
                          'new_contact'.tr,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Center(
                        child: Text(
                          'new_contact_details'.tr,
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
                          labelText: 'fullname'.tr,
                        ),
                        InputField(
                          placeholderText: 'Jeronimo Ovejas Ortega',
                          fieldController: customerFullName,
                          suffixIconImage: 'assets/ListTrailingEditIcon.png',
                          suffixIconImageWidth: 5,
                          suffixIconImageHeight: 5,
                          sufficIconPadding: 15,
                          keyboardType: TextInputType.name,

                        ),
                        FormLabelText(
                          labelText: 'email'.tr,
                        ),
                        InputField(
                          placeholderText: 'jeronimo@aqcess.com',
                          fieldController: customerEmail,
                          suffixIconImage: 'assets/ListTrailingEditIcon.png',
                          suffixIconImageWidth: 5,
                          suffixIconImageHeight: 5,
                          sufficIconPadding: 15,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        FormLabelText(
                          labelText: 'visit_type'.tr,
                        ),
                        InputField(
                          placeholderText: 'Familiar, Servicios, Amigo...',
                          fieldController: customerVisitType,
                          suffixIconImage: 'assets/ListTrailingEditIcon.png',
                          suffixIconImageWidth: 5,
                          suffixIconImageHeight: 5,
                          sufficIconPadding: 15,
                          keyboardType: TextInputType.text,
                        ),
                        FormLabelText(
                          labelText: 'phone'.tr,
                        ),
                        InputField(
                          placeholderText: '+52 442 6687402',
                          fieldController: customerPhone,
                          suffixIconImage: 'assets/ListTrailingEditIcon.png',
                          suffixIconImageWidth: 5,
                          suffixIconImageHeight: 5,
                          sufficIconPadding: 15,
                          keyboardType: TextInputType.numberWithOptions(decimal: false,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          widget.update? Padding(
            padding:  EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                onPressed: () {

                  String _customerFullName =  customerFullName.text;
                  String _customerVisitType =  customerVisitType.text;
                  String _customerEmail =  customerEmail.text;
                  String _phone =  customerPhone.text;



                    Get.find<PassController>().deleteContact(widget.cont.id, context);


                },
                child: Text(
                  'delete_contact'.tr,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ):SizedBox(),
          Padding(
            padding:  EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                onPressed: () {

                  String _customerFullName =  customerFullName.text;
                  String _customerVisitType =  customerVisitType.text;
                  String _customerEmail =  customerEmail.text;
                  String _phone =  customerPhone.text;


if (widget.update){
  Get.find<PassController>().updateContact(_customerFullName,_customerEmail,_customerVisitType,_phone,widget.cont.id, context);
}
else{

                  Get.find<PassController>().addContact(_customerFullName,_customerEmail,_customerVisitType,_phone, context);}
                },
                child: Text(
                  widget.update ?'Update Changes':'Save Changes',
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
