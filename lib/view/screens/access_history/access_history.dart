import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/AccessHistoryLists.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/controller/pass_controller.dart';
import 'package:six_cash/view/screens/home/home_screen.dart';

import '../../../data/model/pass_model.dart';
import '../../../util/dimensions.dart';
import '../../base/no_data_screen.dart';
import '../history/widget/history_shimmer.dart';

class AccessHistory extends StatefulWidget {
  const AccessHistory({Key key}) : super(key: key);

  @override
  State<AccessHistory> createState() => _AccessHistoryState();
}

class _AccessHistoryState extends State<AccessHistory> {
  Future<void> _loadData(BuildContext context, bool reload) async {
    //Get.find<BannerController>().getBannerList(reload);
    // Get.find<RequestedMoneyController>().getRequestedMoneyList(1 ,reload: reload );
    // Get.find<RequestedMoneyController>().getOwnRequestedMoneyList(1 ,reload: reload );
    // Get.find<TransactionHistoryController>().getTransactionData(1, reload: reload);
    //Get.find<WebsiteLinkController>().getWebsiteList();
    // Get.find<NotificationController>().getNotificationList();
    // Get.find<TransactionMoneyController>().getPurposeList();
    //Get.find<ContactsController>().getContactsData(offset);
    Get.find<PassController>().getPassHistory(1, reload: true);
    //  Get.find<TransactionMoneyController>().getWithdrawMethods(isReload: reload);
    //Get.find<RequestedMoneyController>().getWithdrawHistoryList();
  }

  @override
  void initState() {
    _loadData(context, false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "access_history".tr,
        backButton: HomeScreen(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              color: AqcessColors().primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FormLabelText(
                    labelText: "visitor".tr,
                    TextColor: Colors.white,
                    paddingtop: 0,
                    paddingbottom: 0,
                    paddingleft: 0,
                    paddingright: 0,
                  ),
                  FormLabelText(
                    labelText: "dateTime".tr,
                    TextColor: Colors.white,
                    paddingtop: 0,
                    paddingbottom: 0,
                    paddingleft: 20,
                    paddingright: 0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:50, vertical: 10),
              child: SingleChildScrollView(
                child:
                    GetBuilder<PassController>(builder: (transactionHistory) {
                  List<HistoryData> transactionList =
                      transactionHistory.passHistory;

                  return Column(
                    children: [
                      !transactionHistory.firstLoadingHistory
                          ? transactionList.length != 0
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: transactionList.length,
                                      itemBuilder: (ctx, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              child: AccessHistoryLists(
                                                  name: transactionList[index]
                                                      .fullName,
                                                  date: transactionList[index]
                                                      .date,
                                                  time: transactionList[index]
                                                      .startDate),
                                            ),
                                            Divider(),
                                          ],
                                        );
                                      }),
                                )
                              : NoDataFoundScreen(fromHome: false)
                          : HistoryShimmer(),
                      transactionHistory.isLoadingHistory
                          ? Center(
                              child: Padding(
                              padding: EdgeInsets.all(
                                  Dimensions.PADDING_SIZE_DEFAULT),
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor)),
                            ))
                          : SizedBox.shrink(),
                    ],
                  );
                }),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         AccessHistoryLists(
            //             name: "John Doe Sharma",
            //             date: "23/05/2023",
            //             time: "10:54 Am"),
            //         Divider(),
            //         AccessHistoryLists(
            //             name: "John Doe Sharma",
            //             date: "23/05/2023",
            //             time: "10:54 Am"),
            //         Divider(),
            //         AccessHistoryLists(
            //             name: "John Doe Sharma",
            //             date: "23/05/2023",
            //             time: "10:54 Am"),
            //         Divider(),
            //         AccessHistoryLists(
            //             name: "John Doe Sharma",
            //             date: "23/05/2023",
            //             time: "10:54 Am"),
            //         Divider(),
            //         AccessHistoryLists(
            //             name: "John Doe Sharma",
            //             date: "23/05/2023",
            //             time: "10:54 Am"),
            //         Divider()
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
