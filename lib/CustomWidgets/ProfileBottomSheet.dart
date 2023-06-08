import 'package:six_cash/CustomWidgets/ListStyleCard.dart';
import 'package:flutter/material.dart';

Future<dynamic> LoginBottomSheet(BuildContext context, Size size ,String type ) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: size.height - 400,
        width: size.width,
        // color: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            
            ),
            color: Colors.white
          ),
          child:  Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text(
                    "Select User Type",
                    style: TextStyle(fontSize: 24),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Select your type of profile",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              InkWell(
                onTap: (){
                  type = '3';
                },
                child: ListStyleCard(
                  imagePath: "assets/SamplePicture.png",
                  heading: "Resident",
                  subText: "I live in a building or residence",
                ),
              ),
              InkWell(
                onTap: (){
                  type = '2';
                },
                child: ListStyleCard(
                  imagePath: "assets/SamplePicture.png",
                  heading: "Administrator",
                  subText: "I administrate the building or residence",
                ),
              ),
              InkWell(
                onTap: (){
                  type = '1';
                },
                child: ListStyleCard(
                  imagePath: "assets/SamplePicture.png",
                  heading: "Checkpoint",
                  subText: "I work for the building or residence",
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
