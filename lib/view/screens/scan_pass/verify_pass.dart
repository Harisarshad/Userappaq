
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:six_cash/controller/pass_controller.dart';
import 'package:six_cash/controller/screen_shot_widget_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/custom_logo.dart';

import '../../../../Constants.dart';
import '../../../../CustomWidgets/FormLabelText.dart';
import '../../../../data/model/body/pass_body.dart';
import '../../../../data/model/pass_model.dart';
import '../history/widget/history_shimmer.dart';
class VerifyPassScreen extends StatefulWidget {
  final String qrCode;
  final String phoneNumber;
  final PassBody signUpBody;
  const VerifyPassScreen({@required this.qrCode, @required this.phoneNumber, this.signUpBody});

  @override
  State<VerifyPassScreen> createState() => _QrCodeDownloadOrShareScreenState();
}

class _QrCodeDownloadOrShareScreenState extends State<VerifyPassScreen> {

  Future<void> _loadData(BuildContext context, bool reload) async {
    Get.find<PassController>().passVerify(widget.phoneNumber,context);
    //Get.find<BannerController>().getBannerList(reload);
    // Get.find<RequestedMoneyController>().getRequestedMoneyList(1 ,reload: reload );
    // Get.find<RequestedMoneyController>().getOwnRequestedMoneyList(1 ,reload: reload );
    // Get.find<TransactionHistoryController>().getTransactionData(1, reload: reload);
    //Get.find<WebsiteLinkController>().getWebsiteList();
    // Get.find<NotificationController>().getNotificationList();
    // Get.find<TransactionMoneyController>().getPurposeList();
    // Get.find<TransactionMoneyController>().fetchContact();
    //  Get.find<TransactionMoneyController>().getWithdrawMethods(isReload: reload);
    //Get.find<RequestedMoneyController>().getWithdrawHistoryList();
  }

  @override
  void initState() {
  //  _loadData(context, false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Screenshot(
        controller: Get.find<ScreenShootWidgetController>().statementController,
        child: GetBuilder<PassController>(builder: (transactionHistory){
          Pass transactionList = transactionHistory.passDetailsModelv;



          return !transactionHistory.isDetails ? transactionList != null ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Scaffold(
              backgroundColor: AqcessColors().primary,
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Text(
                          "Visitor Pass",
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        ),
                      ),
                      Container(
                        width: 300,
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
                                child:  SvgPicture.string(transactionList.qrCode,height: size.width*0.6,width: size.width*0.6),

                                // Image.asset(
                                //   "assets/QRcode.png",
                                //   width: 400,
                                //   height: 250,
                                // )

                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Container(
                                          child: FormLabelText(
                                            labelText: "Visitor",
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
                                            labelText: transactionList.fullName,
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
                                            labelText: "Resident",
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
                                            labelText: transactionList.address,
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
                                            labelText: "Time And Date",
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
                                            labelText: transactionList.date,
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
                                            labelText: "Address",
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
                                            labelText: transactionList.address,
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
                                "To access, the two-dimensional QR code must be valid in the lane designated for visitors with security personnel.",
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
                                "To access, the two-dimensional QR code must be valid in the lane designated for visitors with security personnel.",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   margin: const EdgeInsets.fromLTRB(16, 15, 16, 5),
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.white,
                      //       foregroundColor: AqcessColors().primary,
                      //       elevation: 8,
                      //       shape: const RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.all(
                      //           Radius.circular(8),
                      //         ),
                      //       ),
                      //       minimumSize: Size(400, 50),
                      //     ),
                      //     onPressed: () {},
                      //     child: Text(
                      //       "Send Pass",
                      //       style: TextStyle(fontSize: 18),
                      //     ),
                      //   ),
                      // ),
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
                          onPressed: () {Navigator.pop(context);},
                          child: Text(
                            "Back To Home",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     CustomLogo(height: Dimensions.BIG_LOGO, width: Dimensions.BIG_LOGO),
                      //     const SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                      //
                      //     Text(
                      //       Get.find<SplashController>().configModel.companyName,
                      //       style: rubikMedium.copyWith(color: Theme.of(context).primaryColor,
                      //           fontSize: Dimensions.FONT_SIZE_OVER_OVER_LARGE),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
                      //

                      // const SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      //
                      // Text(
                      //   widget.phoneNumber,
                      //   style: rubikRegular.copyWith(
                      //     color: ColorResources.phoneNumberColor,
                      //     fontSize: Dimensions.FONT_SIZE_EXTRA_OVER_LARGE,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      // const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      //
                      // Divider(
                      //   color: ColorResources.phoneNumberColor,
                      //   height: 1,
                      //   endIndent: size.width * 0.3,
                      //   indent: size.width * 0.3,
                      // ),
                      // const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      //
                      // Divider(
                      //   color: ColorResources.phoneNumberColor,
                      //   height: 1,
                      //   endIndent: size.width * 0.4,
                      //   indent: size.width * 0.4,
                      // ),
                      // const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      // Text(
                      //   'scan_the_QR_code_to_send_money'.tr,
                      //   style: rubikSemiBold.copyWith(
                      //     color: ColorResources.phoneNumberColor,
                      //     fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      // const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      // Container(
                      //   height: 30,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(gradient: LinearGradient(
                      //     colors: ColorResources.ssColor,
                      //     begin: Alignment.centerLeft,
                      //     end: Alignment.centerRight,
                      //   )),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ) : SizedBox(): HistoryShimmer();






        }),





      ),
    );
  }
}
