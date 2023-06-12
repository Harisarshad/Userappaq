
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';
import '../../../CustomWidgets/FormLabelText.dart';

class PassCreated extends StatefulWidget {

  String visitorName = "Jeronimo Ovejas Ortega";
  String visitorResidence = "Alejandra Cortés B.";
  String visitorAddress = "Av. Principal  #124 CP 24502";
  String passtime = "14-06-23 11:30am";

  @override
  State<PassCreated> createState() => _PassCreatedState();
}

class _PassCreatedState extends State<PassCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AqcessColors().primary,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 5),
                child: Text(
                  "Visitor Pass",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
              Container(
                width: 350,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Image.asset(
                        "assets/navbar-logo.png",
                        width: 100,
                        height: 20,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          "assets/QRcode.png",
                          width: 400,
                          height: 250,
                        )),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Container(
                                  child: FormLabelText(
                                    labelText: "visitor".tr,
                                    TextColor: AqcessColors().primary,
                                    paddingbottom: 0,
                                    paddingtop: 0,
                                    fontSize: 16,
                                  )),
                            ),
                            SizedBox(
                              width: 200,
                              child: Container(
                                  child: FormLabelText(
                                    labelText: widget.visitorName,
                                    paddingtop: 0,
                                  )),
                            ),
                          ],
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
                                    labelText: "resident".tr,
                                    TextColor: AqcessColors().primary,
                                    paddingbottom: 0,
                                    paddingtop: 0,
                                    fontSize: 16,
                                  )),
                            ),
                            SizedBox(
                              width: 200,
                              child: Container(
                                  child: FormLabelText(
                                    labelText: widget.visitorResidence,
                                    paddingtop: 0,
                                  )),
                            ),
                          ],
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
                                    labelText: "time_and_date".tr,
                                    TextColor: AqcessColors().primary,
                                    paddingbottom: 0,
                                    paddingtop: 0,
                                    fontSize: 16,
                                  )),
                            ),
                            SizedBox(
                              width: 200,
                              child: Container(
                                  child: FormLabelText(
                                    labelText: widget.passtime,
                                    paddingtop: 0,
                                  )),
                            ),
                          ],
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
                                    labelText: "address".tr,
                                    TextColor: AqcessColors().primary,
                                    paddingbottom: 0,
                                    paddingtop: 0,
                                    fontSize: 16,
                                  )),
                            ),
                            SizedBox(
                              width: 200,
                              child: Container(
                                  child: FormLabelText(
                                    labelText: widget.visitorAddress,
                                    paddingtop: 0,
                                  )),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 325,
                      child: Text(
                        "qr_code_access".tr,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 325,
                      child: Text(
                        "qr_code_access".tr,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 15, 16, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AqcessColors().primary,
                    elevation: 8,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    minimumSize: Size(400, 50),
                  ),
                  onPressed: () {},
                  child: Text(
                    "sendpass".tr,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 15, 16, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AqcessColors().primary,
                    elevation: 8,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    minimumSize: Size(400, 50),
                  ),
                  onPressed: () {},
                  child: Text(
                    "back_to_home",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
