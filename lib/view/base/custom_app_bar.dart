import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/custom_ink_well.dart';
import 'package:six_cash/view/base/roundedButton.dart';

import '../../CustomWidgets/FormLabelText.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onTap;
  final bool isSkip;
  final String iconText;
  final Function function;
  const CustomAppbar({@required this.title, this.onTap,this.isSkip = false, this.function, this.iconText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // leadingWidth: 120,
      leading: SizedBox(
        width: 200,
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {      Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                  ),
                ),
              ),
              FormLabelText(
                labelText: iconText ?? 'back'.tr,
                paddingbottom: 0,
                paddingtop: 0,
                paddingleft: 0,
                paddingright: 0,
              )
            ],
          ),
        ),
      ),
      centerTitle: true,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Divider(color: Colors.grey.shade400),
      ),
    );



  }

  @override
  Size get preferredSize => Size(double.maxFinite, Dimensions.APPBAR_HIGHT_SIZE);
}
