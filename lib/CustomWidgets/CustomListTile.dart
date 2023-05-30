import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    key,
    this.imagePath = "assets/SamplePicture.png",
     this.userName,
    this.userEmail = "No email found",
  });
  final String imagePath;
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
          trailing: Image.asset(
            "assets/ListTrailingEditIcon.png",
            width: 20,
            height: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: const Divider(height: 0),
        ),
      ],
    );
  }
}

