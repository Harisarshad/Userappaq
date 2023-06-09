import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/controller/banner_controller.dart';
import 'package:six_cash/controller/home_controller.dart';
import 'package:six_cash/controller/notification_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/requested_money_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/controller/transaction_controller.dart';
import 'package:six_cash/controller/transaction_history_controller.dart';
import 'package:six_cash/controller/websitelink_controller.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/base/contact_shimmer.dart';
import 'package:six_cash/view/base/contact_view.dart';
import 'package:six_cash/view/screens/access_history/access_history.dart';
import 'package:six_cash/view/screens/amenities/amenities.dart';
import 'package:six_cash/view/screens/contacts/contacts.dart';
import 'package:six_cash/view/screens/home/widget/app_bar_base.dart';
import 'package:six_cash/view/screens/home/widget/bottom_sheet/expandable_contant.dart';
import 'package:six_cash/view/screens/home/widget/bottom_sheet/persistent_header.dart';
import 'package:six_cash/view/screens/home/widget/first_card_portion.dart';
import 'package:six_cash/view/screens/home/widget/linked_website.dart';
import 'package:six_cash/view/screens/home/widget/secend_card_portion.dart';
import 'package:six_cash/view/screens/home/widget/shimmer/web_site_shimmer.dart';
import 'package:six_cash/view/screens/home/widget/third_card_portion.dart';
import 'package:six_cash/view/screens/regular_visit/regular_visit.dart';
import 'package:six_cash/view/screens/residents/residents.dart';
import 'package:six_cash/view/screens/scan_pass/scan_pass.dart';

import '../../../Constants.dart';
import '../../../CustomWidgets/Tile.dart';
import '../../../controller/screen_shot_widget_controller.dart';
import '../../../helper/route_helper.dart';
import '../../../helper/transaction_type.dart';
import '../scan_pass/pass_list.dart';
import '../transaction_money/transaction_money_balance_input.dart';
import '../transaction_money/transaction_money_screen.dart';
import 'create_pass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFirst = true;

  Future<void> _loadData(BuildContext context, bool reload) async {
    Get.find<ProfileController>().profileData(reload: reload);
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
    _loadData(context, false);
    isFirst = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBarBase(),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await _loadData(context, true);
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: GetBuilder<ProfileController>(builder: (usercontroller) {
                return usercontroller.isLoading
                    ? WebSiteShimmer()
                    : Column(
                        children: [
                          usercontroller.userInfo.type == 1
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //User Type "Administrator"
                                    Container(
                                      height: 25,
                                      color: Colors.black,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Administrator",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AqcessColors().secondary,
                                            fontSize: 12),
                                      ),
                                    ),
                                    //Rows Contains 2 card each....
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        //Pass
                                        InkWell(
                                          onTap: () {
                                            Get.to(CreatePass());
                                          },
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().primary,
                                            secondaryColor:
                                                AqcessColors().secondary,
                                            imagePath: "assets/primary.png",
                                            text: "Create a Pass",
                                            subText:
                                                "Here you can create a pass\nfor visitors to access",
                                          ),
                                        ),
                                        //Contacts
                                        InkWell(
                                          onTap: () {
                                           // Get.to(Contacts());

                                            Get.to(() => Contacts());
                                          },
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().secondary,
                                            secondaryColor: Colors.black,
                                            imagePath: "assets/Contact.png",
                                            text: "Contacts",
                                            subText:
                                                "Here you will find your\ncontacts",
                                          ),
                                        ),
                                      ],
                                    ),
                                    //Second Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(BookedAmenities());
                                          },
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().secondary,
                                            secondaryColor: Colors.black,
                                            imagePath: "assets/Amenties.png",
                                            text: "Amenities",
                                            subText:
                                                "Here you can view and\nbook amenties",
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(AccessHistory());
                                          },
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().secondary,
                                            secondaryColor: Colors.black,
                                            imagePath: "assets/History.png",
                                            text: "History",
                                            subText:
                                                "Here you can see the\ncheckpoint’s history.",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        //Scan Pass
                                        InkWell(
                                          onTap: () {
                                            Get.to(ScanPass());
                                          },
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().secondary,
                                            secondaryColor: Colors.black,
                                            imagePath: "assets/ScanPass.png",
                                            text: "Scan Pass",
                                            subText:
                                                "Here you can scan a pass\nto provide access to a visitor",
                                          ),
                                        ),
                                        // Amenities Admin
                                        InkWell(
                                          onTap: () {
                                            Get.to(BookedAmenities());
                                          },
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().secondary,
                                            secondaryColor: Colors.black,
                                            imagePath: "assets/Amenties.png",
                                            text: "Amenities Admin",
                                            subText:
                                                "Here you can create, manage\nand delete amenities.",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // Residents
                                        InkWell(
                                          onTap: () {
                                            Get.to(Residents());
                                          },
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().secondary,
                                            secondaryColor: Colors.black,
                                            imagePath: "assets/Residents.png",
                                            text: "Residents",
                                            subText:
                                                "Here you will find your\nResidents",
                                          ),
                                        ),
                                        //Admin Signout.
                                        InkWell(
                                          onTap: () {},
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().secondary,
                                            secondaryColor: Colors.black,
                                            imagePath: "assets/SignOut.png",
                                            text: "Sign Out",
                                            subText:
                                                "Here you can sign out of\nyour account",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : usercontroller.userInfo.type == 2
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                          // User Type Resident...
                                          Container(
                                            height: 25,
                                            color: Colors.black,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Resident",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color:
                                                      AqcessColors().secondary,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              //Resident Create Pass
                                              InkWell(
                                                onTap: () {
                                                  Get.to(CreatePass());
                                                },
                                                child: Tile(
                                                  primaryColor:
                                                      AqcessColors().primary,
                                                  secondaryColor:
                                                      AqcessColors().secondary,
                                                  imagePath:
                                                      "assets/primary.png",
                                                  text: "Create a Pass",
                                                  subText:
                                                      "Here you can create a pass\nfor visitors to access",
                                                ),
                                              ),
                                              //Resident Contacts..
                                              InkWell(
                                                onTap: () {
                                                  Get.to(Contacts());
                                                },
                                                child: Tile(
                                                  primaryColor:
                                                      AqcessColors().secondary,
                                                  secondaryColor: Colors.black,
                                                  imagePath:
                                                      "assets/Contact.png",
                                                  text: "Contacts",
                                                  subText:
                                                      "Here you will find your\ncontacts",
                                                ),
                                              ),
                                            ],
                                          ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            //Resident Create Pass
                                            InkWell(
                                              onTap: () {
                                              //  Get.to(CreatePass());
                                                Get.to(PassList());
                                              },
                                              child: Tile(
                                                primaryColor:
                                                AqcessColors().primary,
                                                secondaryColor:
                                                AqcessColors().secondary,
                                                imagePath:
                                                "assets/primary.png",
                                                text: "Pass List",
                                                subText:
                                                "Here you can see a pass\nfor visitors to access",
                                              ),
                                            ),
                                            //Resident Contacts..
                                            InkWell(
                                              onTap: () {
                                                Get.to(BookedAmenities());
                                              },
                                              child: Tile(
                                                primaryColor:
                                                AqcessColors().secondary,
                                                secondaryColor: Colors.black,
                                                imagePath:
                                                "assets/amenties.png",
                                                text: "Amenties",
                                                subText:
                                                "Here you can view and\nbook amenties",
                                              ),
                                            ),
                                          ],
                                        ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              //Residents Amenities

                                              //Resident Sign Out
                                              InkWell(
                                                onTap: () => Get.find<ScreenShootWidgetController>().qrCodeDownloadAndShare(qrCode: Get.find<ProfileController>().userInfo.qrCode, phoneNumber: Get.find<ProfileController>().userInfo.phone,isShare: true),

                                                child: Tile(
                                                  primaryColor:
                                                      AqcessColors().secondary,
                                                  secondaryColor: Colors.black,
                                                  imagePath:
                                                      "assets/SignOut.png",
                                                  text: "Sign Out",
                                                  subText: "SignOut of the app",
                                                ),
                                              ),
                                            ],
                                          )
                                        ])
                                  : usercontroller.userInfo.type == 3
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                              //User Type CHECKPOINT
                                              Container(
                                                height: 25,
                                                color: Colors.black,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Checkpoint",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: AqcessColors()
                                                          .secondary,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  //Checkpoint Regular Visit.
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          UserReservations());
                                                    },
                                                    child: Tile(
                                                      primaryColor:
                                                          AqcessColors()
                                                              .primary,
                                                      secondaryColor:
                                                          AqcessColors()
                                                              .secondary,
                                                      imagePath:
                                                          "assets/primary.png",
                                                      text: "Regular Visit",
                                                      subText:
                                                          "here you can manually\nregister a visit",
                                                    ),
                                                  ),
                                                  //Checkpoint Scan Pass
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(ScanPass());
                                                    },
                                                    child: Tile(
                                                      primaryColor:
                                                          AqcessColors()
                                                              .secondary,
                                                      secondaryColor:
                                                          Colors.black,
                                                      imagePath:
                                                          "assets/ScanPass.png",
                                                      text: "Scan Pass",
                                                      subText:
                                                          "Here you can scan a pass to\nprovide access to a vistor",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  //Checkpoint History...
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(AccessHistory());
                                                    },
                                                    child: Tile(
                                                      primaryColor:
                                                          AqcessColors()
                                                              .secondary,
                                                      secondaryColor:
                                                          Colors.black,
                                                      imagePath:
                                                          "assets/History.png",
                                                      text: "History",
                                                      subText:
                                                          "Here you can see the\ncheckpoint's history",
                                                    ),
                                                  ),
                                                  //Checkpoint Bookings
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          UserReservations());
                                                    },
                                                    child: Tile(
                                                      primaryColor:
                                                          AqcessColors()
                                                              .secondary,
                                                      secondaryColor:
                                                          Colors.black,
                                                      imagePath:
                                                          "assets/Amenties.png",
                                                      text: "Bookings",
                                                      subText:
                                                          "Here you can see booked\namenties",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 10, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Tile(
                                                        primaryColor:
                                                            AqcessColors()
                                                                .secondary,
                                                        secondaryColor:
                                                            Colors.black,
                                                        imagePath:
                                                            "assets/SignOut.png",
                                                        text: "Sign Out",
                                                        subText:
                                                            "Here you can sign out of your\naccount")
                                                  ],
                                                ),
                                              )
                                            ])
                                      : SizedBox(
                                          height:
                                              Dimensions.PADDING_SIZE_DEFAULT),

                          // GetBuilder<WebsiteLinkController>(builder: (websiteLinkController){
                          //   return websiteLinkController.isLoading ? WebSiteShimmer() :
                          //   websiteLinkController.websiteList.length > 0 ?  LinkedWebsite() : SizedBox();
                          // }),
                          const SizedBox(height: 80),
                        ],
                      );
              }
                  // child: GetBuilder<SplashController>(builder: (splashController) {
                  //   return Column(
                  //     children: [
                  //       splashController.configModel.themeIndex == '1'
                  //           ? GetBuilder<ProfileController>(builder: (profile)=> FirstCardPortion())
                  //           : splashController.configModel.themeIndex == '2' ? SecondCardPortion() : splashController.configModel.themeIndex == '3' ? ThirdCardPortion() :
                  //       GetBuilder<ProfileController>(builder: (profile)=> FirstCardPortion()),
                  //
                  //       SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  //
                  //       GetBuilder<WebsiteLinkController>(builder: (websiteLinkController){
                  //         return websiteLinkController.isLoading ? WebSiteShimmer() :
                  //         websiteLinkController.websiteList.length > 0 ?  LinkedWebsite() : SizedBox();
                  //       }),
                  //       const SizedBox(height: 80),
                  //     ],
                  //   );
                  // }
                  ),
            ),
          ),
          // persistentContentHeight: 70,
          // persistentHeader: CustomPersistentHeader(),
          // expandableContent: CustomExpandableContant()
        ),
      );
    });
  }
}


//  Get.to(TransactionMoneyBalanceInput(transactionType: 'add_money'));
                                        //   Get.to(()=> TransactionMoneyScreen(
                                        //     fromEdit: false,
                                        //     transactionType: TransactionType.SEND_MONEY,
                                        //   ));
                                        //  RouteHelper.getCreatePassRoute();  print("ASASASas");