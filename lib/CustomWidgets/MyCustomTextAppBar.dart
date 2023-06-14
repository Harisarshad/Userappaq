import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:flutter/material.dart';

class MyCustomTextAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String iconText;
  final String titleText;
  final IconData appbarLeadingIcon;
  final Widget backButton;

  const MyCustomTextAppBar({
    Key key,
    this.iconText = "Back",
    this.titleText = "Amenities",
    this.appbarLeadingIcon = Icons.chevron_left_outlined,
    this.backButton,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
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
                labelText: iconText,
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
      title: Text(
        titleText,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Divider(color: Colors.grey.shade400),
      ),
    );
  }
}
