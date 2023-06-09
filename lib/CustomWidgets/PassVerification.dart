import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class PassVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
//camera screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AqcessColors().secondary,
        title: Center(
          child: Image.asset(
            "assets/navbar-logo.png",
            width: 100,
            height: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/QRcode.png",
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 240, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 600,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 29, 113, 247),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 75, 0, 20),
                      child: Column(children: [
                        Text(
                          "Verified",
                          style: TextStyle(color: Colors.white, fontSize: 32),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Visitor can access",
                          style: TextStyle(color: Colors.white, fontSize: 32),
                          textAlign: TextAlign.left,
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                            children: [
                              FormLabelText(
                                labelText: "Visitor",
                                TextColor: Colors.white,
                                paddingbottom: 0,
                                paddingleft: 0,
                                paddingright: 0,
                                paddingtop: 0,
                                fontSize: 18,
                              ),
                              FormLabelText(
                                labelText: "Jeronimo Ovejas Ortega",
                                TextColor: Colors.white,
                                paddingbottom: 0,
                                paddingleft: 0,
                                paddingright: 0,
                                paddingtop: 0,
                                fontSize: 22,
                                
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                            children: [
                              FormLabelText(
                                labelText: "Resident",
                                TextColor: Colors.white,
                                paddingbottom: 0,
                                paddingleft: 0,
                                paddingright: 0,
                                paddingtop: 0,
                              ),
                              FormLabelText(
                                labelText: "John Doe Nomin",
                                TextColor: Colors.white,
                                paddingbottom: 0,
                                paddingleft: 0,
                                paddingright: 0,
                                paddingtop: 0,
                                fontSize: 22,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                            children: [
                              FormLabelText(
                                labelText: "Date and time",
                                TextColor: Colors.white,
                                paddingbottom: 0,
                                paddingleft: 0,
                                paddingright: 0,
                                paddingtop: 0,
                              ),
                              FormLabelText(
                                labelText: "14/Jan/2023 - 12:00 Pm",
                                TextColor: Colors.white,
                                paddingbottom: 0,
                                paddingleft: 0,
                                paddingright: 0,
                                paddingtop: 0,
                                fontSize: 22,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 100, 16,0 ),
                      child: ButtonCustom(buttonText: "Home", onPress: (){},backgroundColor: Colors.white,foregroundColor: Color.fromARGB(255, 29, 113, 247),),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 185,
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 29, 113, 247),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: Colors.white, // Color of the circle
                    radius: 24,
                    child: Icon(
                      Icons.check,
                      color: Color.fromARGB(
                          255, 29, 113, 247), // Color of the tick
                      size: 36,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
