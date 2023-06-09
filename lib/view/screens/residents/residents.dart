import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/CustomWidgets/CustomListTile.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/InputFieldWithSearch.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/CustomWidgets/OnTapCustomListTile.dart';

import '../../../controller/resident_controller.dart';
import '../../../data/model/resident_model.dart';
import '../../../util/dimensions.dart';
import '../../base/no_data_screen.dart';
import '../history/widget/history_shimmer.dart';

class Residents extends StatefulWidget {

     Residents({Key key}) : super(key: key);


  @override
  State<Residents> createState() => _ResidentsState();
}

class _ResidentsState extends State<Residents> {
   final TextEditingController searchString = TextEditingController();

  // Overriding them for initializing them
   bool isFirst =true;
   @override
   void initState() {
     _loadData(context, false);
     isFirst = false;
     super.initState();
   }
   Future<void> _loadData(BuildContext context, bool reload) async {

     //Get.find<BannerController>().getBannerList(reload);
     // Get.find<RequestedMoneyController>().getRequestedMoneyList(1 ,reload: reload );
     // Get.find<RequestedMoneyController>().getOwnRequestedMoneyList(1 ,reload: reload );
     // Get.find<TransactionHistoryController>().getTransactionData(1, reload: reload);
     //Get.find<WebsiteLinkController>().getWebsiteList();
     // Get.find<NotificationController>().getNotificationList();
     // Get.find<TransactionMoneyController>().getPurposeList();
     //Get.find<ContactsController>().getContactsData(offset);
     Get.find<ResidentsController>().getContactsData(1,'' ,reload: true,);
     Get.find<ResidentsController>().getContactsPending(1, '',reload: true,);
     //  Get.find<TransactionMoneyController>().getWithdrawMethods(isReload: reload);
     //Get.find<RequestedMoneyController>().getWithdrawHistoryList();
   }

// Dont forget to Dispose !!
  @override
  void dispose() {
    searchString.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(titleText: "Approve new users"),
      body: SingleChildScrollView(
        child:





        Column(
          children: [

            InputFieldWithSearch(
              placeholderText: "Search",
              fieldController: searchString,
              prefixIconImage: "assets/Search.png",
           onChange: (String text) {
              // widget.resProvider.setTitle(widget.index, text);
             if(text.length>2){
               Get.find<ResidentsController>().getContactsData(1, text,reload: true );
               Get.find<ResidentsController>().getContactsPending(1,text, reload: true);
             }
            },

            ),
            GetBuilder<ResidentsController>(builder: (transactionHistory){
              List<Resident> transactionList = transactionHistory.contactListPending;



              return !transactionHistory.firstLoadingPending ? transactionList.length != 0 ?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: transactionList.length,
                    itemBuilder: (ctx,index){

                      return Padding(
                        padding:  EdgeInsets.fromLTRB(16, 10, 16, 5),
                        child: Container(
                          decoration:  BoxDecoration(
                            color: Color.fromARGB(255, 222, 222, 224),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: OnTapCustomListTileContainer(
                            imagePath: "assets/Person1.png",
                            userName: transactionList[index].userName,
                            subText: transactionList[index].userName,
                            type: transactionList[index].Type,
                            onTapApprove: () {Get.find<ResidentsController>().getContactsApprove(transactionList[index].id, reload: true);},
                            onTapReject: () {Get.find<ResidentsController>().getContactsReject(transactionList[index].id, reload: true);},
                          ),
                        ),
                      );


                    }),
              ) : SizedBox(): HistoryShimmer();






            }),
            // GetBuilder<ResidentsController>(builder: (transactionHistory){
            //   List<Resident> transactionList = transactionHistory.contactListPending;
            //
            //
            //
            //   return !transactionHistory.firstLoadingPending ? transactionList.length != 0 ?
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            //     child: ListView.builder(
            //         shrinkWrap: true,
            //         physics: NeverScrollableScrollPhysics(),
            //         itemCount: transactionList.length,
            //         itemBuilder: (ctx,index){
            //
            //           return Padding(
            //             padding:  EdgeInsets.fromLTRB(16, 10, 16, 5),
            //             child: Container(
            //               decoration:  BoxDecoration(
            //                 color: Color.fromARGB(255, 222, 222, 224),
            //                 borderRadius: BorderRadius.all(
            //                   Radius.circular(8),
            //                 ),
            //               ),
            //               child: OnTapCustomListTileContainer(
            //                 imagePath: "assets/Person1.png",
            //                 userName: transactionList[index].userName,
            //                 subText: transactionList[index].userName,
            //                 onTapApprove: () {},
            //                 onTapReject: () {},
            //               ),
            //             ),
            //           );
            //
            //
            //         }),
            //   ) : SizedBox(): HistoryShimmer();
            //
            //
            //
            //
            //
            //
            // }),

            // Padding(
            //   padding:  EdgeInsets.fromLTRB(16, 10, 16, 5),
            //   child: Container(
            //     decoration:  BoxDecoration(
            //       color: Color.fromARGB(255, 222, 222, 224),
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(8),
            //       ),
            //     ),
            //     child: OnTapCustomListTileContainer(
            //       imagePath: "assets/Person1.png",
            //       userName: "John Doe Sharma",
            //       subText: "Main Street 1001",
            //       onTapApprove: () {},
            //       onTapReject: () {},
            //     ),
            //   ),
            // ),
            GetBuilder<ResidentsController>(builder: (transactionHistory){
              List<Resident> transactionList = transactionHistory.contactList;



              return !transactionHistory.firstLoading ? transactionList.length != 0 ?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: transactionList.length,
                    itemBuilder: (ctx,index){
                     return CustomListTile(
                        userName: transactionList[index].userName,
                        userEmail: transactionList[index].email,
                        imagePath: "assets/Person1.png",
                        edit: false,
                      );
                      // return Padding(
                      //   padding:  EdgeInsets.fromLTRB(16, 10, 16, 5),
                      //   child: Container(
                      //     decoration:  BoxDecoration(
                      //       color: Color.fromARGB(255, 222, 222, 224),
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(8),
                      //       ),
                      //     ),
                      //     child: OnTapCustomListTileContainer(
                      //       imagePath: "assets/Person1.png",
                      //       userName: transactionList[index].userName,
                      //       subText: transactionList[index].userName,
                      //       onTapApprove: () {},
                      //       onTapReject: () {},
                      //     ),
                      //   ),
                      // );


                    }),
              ) : SizedBox(): HistoryShimmer();






            }),
            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       CustomListTile(
            //         userName: "John Doe Sharma",
            //         userEmail: "Johndoe@mail.com",
            //         imagePath: "assets/Person1.png",
            //         edit: false,
            //       ),
            //       CustomListTile(
            //         userName: "John Doe Sharma",
            //         userEmail: "Johndoe@mail.com",
            //         imagePath: "assets/Person2.png",
            //         edit: false,
            //       ),
            //       CustomListTile(
            //         userName: "John Doe Sharma",
            //         userEmail: "Johndoe@mail.com",
            //         imagePath: "assets/Person3.png",
            //         edit: false,
            //       ),
            //
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}