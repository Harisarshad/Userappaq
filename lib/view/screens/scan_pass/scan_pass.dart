import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';

import '../auth/selfie_capture/camera_screen.dart';
import '../transaction_money/widget/scan_button.dart';

class ScanPass extends StatelessWidget {
  const ScanPass({Key key}) : super(key: key);

  // Constants
  static const double overlappingLayerSize = 400;
  static const String scanPassPrototypeAsset = 'assets/ScanPassPrototype.png';
  static const String overlappingLayerAsset = 'assets/OverlappingLayer.png';
  static const String rectangleAsset = 'assets/Rectangle.png';
  static const String qrCodeAsset = 'assets/QRcode.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 200,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon:  Icon(
                    Icons.chevron_left_outlined,
                  ),
                ),
              ),
               Text(
                "back_to_page".tr,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        centerTitle: true
        ,
        title: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 65, 0),
            child: Text('scanpass'.tr),
          ),
        ),
        
      ),
      body: Stack(
        children: [
          Positioned(
            top: -90, // Adjust this value to move the image upwards
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Transform.scale(
                scale: calculateScale(context),
                child: Image.asset(scanPassPrototypeAsset),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Image.asset(
                overlappingLayerAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 225,
            left: 35,
            child: Image.asset(
              rectangleAsset,
              width: 350,
              height: 250,
            ),
          ),
          Positioned(
            top: 275,
            left: 135,
            child: Image.asset(
              qrCodeAsset,
              width: 150,
              height: 150,
            ),
          ),
          Positioned(
            bottom: 16, // Adjust this value to position the button as needed
            left: 16, // Adjust this value to position the button as needed
            right: 16, // Adjust this value to position the button as needed
            child: ButtonCustom(
              buttonText: "verify_pass".tr,
              onPress: () {
                Get.to(()=> CameraScreen(
                  fromEditProfile: false,
                  isBarCodeScan: true,
                  isHome: true,
                  //transactionType: 'cash_out',
                )) ;             // Add your logic for button press here
              },
            ),
          ),
        ],
      ),
    );
  }

  double calculateScale(BuildContext context) {
    double overlappingLayerSize = MediaQuery.of(context).size.width;
    return overlappingLayerSize / ScanPass.overlappingLayerSize;
  }
}