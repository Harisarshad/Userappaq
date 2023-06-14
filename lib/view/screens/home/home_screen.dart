import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/controller/home_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/screens/access_history/access_history.dart';
// import 'package:six_cash/view/screens/amenities/amenities.dart';
import 'package:six_cash/view/screens/auth/selfie_capture/camera_screen.dart';
import 'package:six_cash/view/screens/contacts/contacts.dart';
import 'package:six_cash/view/screens/home/widget/shimmer/web_site_shimmer.dart';
import 'package:six_cash/view/screens/regular_visit/regular_visit.dart';
import 'package:six_cash/view/screens/residents/residents.dart';
import 'package:six_cash/view/screens/scan_pass/scan_pass.dart';

import '../../../Constants.dart';
import '../../../CustomWidgets/Tile.dart';
import '../../../controller/screen_shot_widget_controller.dart';
import '../amenities/booked_amenity.dart';
import '../scan_pass/pass_list.dart';
import 'create_pass.dart';
import 'widget/appbar_custom.dart';

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
        appBar: AppBarCustomHome(),
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
                                        'administrator'.tr,
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
                                            text: 'create_pass'.tr,
                                            subText: 'create_pass_subtext'.tr,
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
                                            text: "contacts".tr,
                                            subText: 'contacts_subtext'.tr,
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
                                            imagePath: "assets/amenty.png",
                                            text: 'amenities'.tr,
                                            subText: 'amenities_subtext'.tr,
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
                                            text: 'access_history'.tr,
                                            subText:
                                                'access_history_subtext'.tr,
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
                                            text: 'scanpass'.tr,
                                            subText: 'scanpass_subtext'.tr,
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
                                            imagePath: "assets/amenty.png",
                                            text: "amenities_admin".tr,
                                            subText:
                                                'amenities_admin_subtext'.tr,
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
                                            text: "residents".tr,
                                            subText: 'residents_subtext'.tr,
                                          ),
                                        ),
                                        //Admin Signout.
                                        InkWell(
                                          onTap: () {
                                            Get.find<ProfileController>()
                                                .logOut(context);
                                          },
                                          child: Tile(
                                            primaryColor:
                                                AqcessColors().secondary,
                                            secondaryColor: Colors.black,
                                            imagePath: "assets/SignOut.png",
                                            text: "signout".tr,
                                            subText: 'signout_subtext'.tr,
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
                                              'user_resident'.tr,
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
                                                  text: 'create_pass'.tr,
                                                  subText:
                                                      'create_pass_subtext'.tr,
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
                                                  text: "contacts".tr,
                                                  subText:
                                                      "contacts_subtext".tr,
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
                                                  // Get.to(CreatePass());
                                                  Get.to(PassList());
                                                },
                                                child: Tile(
                                                  primaryColor:
                                                      AqcessColors().secondary,
                                                  secondaryColor: Colors.black,
                                                  imagePath:
                                                      "assets/primary.png",
                                                  text: "pass_list".tr,
                                                  subText:
                                                      "pass_list_subtext".tr,
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
                                                      "assets/amenty.png",
                                                  text: "amenities".tr,
                                                  subText:
                                                      "amenities_subtext".tr,
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
                                                onTap: () => Get.find<ProfileController>()
                                                .logOut(context),
                                                child: Tile(
                                                  primaryColor:
                                                      AqcessColors().secondary,
                                                  secondaryColor: Colors.black,
                                                  imagePath:
                                                      "assets/SignOut.png",
                                                  text: "signout".tr,
                                                  subText: "signout_subtext".tr,
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
                                                  "user_type_checkpoint".tr,
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
                                                      text: "regular_visit".tr,
                                                      subText:
                                                          'regular_visit_subtext'
                                                              .tr,
                                                    ),
                                                  ),
                                                  //Checkpoint Scan Pass
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(CameraScreen(
                                                        fromEditProfile: false,
                                                        isBarCodeScan: true,
                                                        isHome: true,
                                                        //transactionType: 'cash_out',
                                                      ));
                                                      // Get.to(ScanPass());
                                                    },
                                                    child: Tile(
                                                      primaryColor:
                                                          AqcessColors()
                                                              .secondary,
                                                      secondaryColor:
                                                          Colors.black,
                                                      imagePath:
                                                          "assets/ScanPass.png",
                                                      text: "scanpass".tr,
                                                      subText:
                                                          "scanpass_subtext".tr,
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
                                                      text: "access_history".tr,
                                                      subText:
                                                          "access_history_subtext"
                                                              .tr,
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
                                                          "assets/amenty.png",
                                                      text: "bookings".tr,
                                                      subText:
                                                          "bookings_subtext".tr,
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
                                                    InkWell(
                                                      onTap: () => Get.find<ProfileController>()
                                                .logOut(context),
                                                      child: Tile(
                                                          primaryColor:
                                                              AqcessColors()
                                                                  .secondary,
                                                          secondaryColor:
                                                              Colors.black,
                                                          imagePath:
                                                              "assets/SignOut.png",
                                                          text: "signout".tr,
                                                          subText:
                                                              "signout_subtext"
                                                                  .tr),
                                                    )
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