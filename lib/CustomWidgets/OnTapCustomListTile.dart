import 'package:six_cash/CustomWidgets/CustomCheckbox.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:flutter/material.dart';

import 'ButtonCustom.dart';

class OnTapCustomListTileContainer extends StatefulWidget {
  final String imagePath;
  final String userName;
  final String subText;
  final VoidCallback onTapApprove;
  final VoidCallback onTapReject;

  OnTapCustomListTileContainer({
    Key key,
     this.imagePath,
     this.userName,
     this.subText,
     this.onTapApprove,
     this.onTapReject,
  }) : super(key: key);

  @override
  State<OnTapCustomListTileContainer> createState() =>
      _OnTapCustomListTileContainerState();
}

class _OnTapCustomListTileContainerState
    extends State<OnTapCustomListTileContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Image.asset(
              widget.imagePath,
              width: 70,
              height: 70,
            ),
          ),
          title: FormLabelText(
                labelText: widget.userName,
                paddingbottom: 0,
                paddingtop: 0,
                paddingleft: 0,
                paddingright: 0,
                fontSize: 18,
              ),
          subtitle: FormLabelText(
                labelText: widget.subText,
                paddingbottom: 0,
                paddingtop: 0,
                paddingleft: 0,
                paddingright: 0,
                fontSize: 14,
              ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Row(
            children: [
              CustomCheckbox(fieldController:true),
              FormLabelText(
                labelText: "Resident",
                paddingbottom: 6,
                paddingleft: 8,
                paddingright: 0,
              ),
              Spacer(),
              CustomCheckbox(fieldController:true),
              FormLabelText(
                labelText: "Checkpoint",
                paddingbottom: 6,
                paddingleft: 8,
                paddingright: 0,
              ),
            ],
          ),
        ),
        ButtonCustom(
          buttonText: "Approve",
          onPress: widget.onTapApprove,
          paddingTop: 15,
          paddingBottom: 0,
        ),
        ButtonCustom(
          buttonText: "Reject",
          onPress: widget.onTapReject,
          paddingTop: 10,
          backgroundColor: Color.fromARGB(255, 226, 26, 26),
        )
      ],
    );
  }
}
