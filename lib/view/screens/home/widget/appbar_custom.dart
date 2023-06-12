import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/controller/menu_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/images.dart';
import 'package:six_cash/view/base/custom_image.dart';

class AppBarCustomHome extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustomHome({Key key}) : super(key: key);

  @override
  State<AppBarCustomHome> createState() => _AppBarCustomHomeState();
  
  // @override
  // // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  

 @override
  Size get preferredSize => Size(double.maxFinite, 50);
}

class _AppBarCustomHomeState extends State<AppBarCustomHome> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        return AppBar(
          backgroundColor: AqcessColors().secondary,
          title: Center(
              child: Image.asset(
            "assets/navbar-logo.png",
            width: 100,
            height: 25,
          )),
          leading: IconButton(
            icon:  Icon(
              Icons.chat_bubble_outline_outlined,
              color: AqcessColors().black,
              size: 25,
            ),
            onPressed: () {},
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: GestureDetector(
                onTap: () =>
                    Get.find<CustomMenuController>().selectProfilePage(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 35,
                    width: 35,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: profileController.userInfo == null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                    Image.asset(Images.avatar, fit: BoxFit.cover),
                              ),
                            )
                          : CustomImage(
                              image:
                                  '${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${profileController.userInfo.image ?? ''}',
                              fit: BoxFit.cover,
                              placeholder: Images.avatar,
                            ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
  
}
