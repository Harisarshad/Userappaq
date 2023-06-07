import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/data/model/contact_model.dart';

import '../view/screens/contacts/add_contact.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({

    key,
    this.cont,
    this.edit,
    this.imagePath = "assets/SamplePicture.png",
     this.userName,
    this.userEmail = "No email found",
  });
  final ContactsData cont;
  final String imagePath;
  final bool edit;
  final String userName;
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(radius: 30,child: Image.asset(imagePath,width: 70,height: 70,),),
          title: Text(userName),
          subtitle: Text(userEmail),
          trailing: edit? InkWell(
            onTap: (){
              Get.to(AddContact(cont: cont ,update: true,));
            },
            child: Image.asset(
              "assets/ListTrailingEditIcon.png",
              width: 20,
              height: 20,
            ),
          ):SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: const Divider(height: 0),
        ),
      ],
    );
  }
}

