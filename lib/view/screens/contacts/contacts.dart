import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/CustomListTile.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/controller/contacts_controller.dart';
import 'package:six_cash/view/screens/contacts/add_contact.dart';

import '../../../data/model/contact_model.dart';
import '../../../util/dimensions.dart';
import '../../base/no_data_screen.dart';
import '../history/widget/history_shimmer.dart';

class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final TextEditingController searchString = TextEditingController();
  bool isFirst = true;
  // Overriding them for initializing them
  @override
  void initState() {
    _loadData(context, false);
    isFirst = false;
    super.initState();
  }

// Dont forget to Dispose !!
  @override
  void dispose() {
    searchString.dispose();
    super.dispose();
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
    Get.find<ContactsController>().getContactsData(1, reload: true);
    //  Get.find<TransactionMoneyController>().getWithdrawMethods(isReload: reload);
    //Get.find<RequestedMoneyController>().getWithdrawHistoryList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "contact".tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
              placeholderText: "search".tr,
              fieldController: searchString,
              prefixIconImage: "assets/Search.png",
              keyboardType: TextInputType.text,
            ),
            Row(
              children: [
                FormLabelText(labelText: "my_contacts".tr),
                Spacer(),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 15, 16, 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AqcessColors().primary,
                      foregroundColor: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.to(AddContact(update: false,));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_outlined,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "add_new".tr,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(

              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child:  GetBuilder<ContactsController>(builder: (transactionHistory){
            List<ContactsData> transactionList = transactionHistory.contactList;



            return  Column(children: [!transactionHistory.firstLoading ? transactionList.length != 0 ?
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transactionList.length,
            itemBuilder: (ctx,index){
            return Container(

            child:  CustomListTile(
              cont: transactionList[index],
                userName: transactionList[index].userName,
                userEmail: transactionList[index].email,
                imagePath: "assets/Person1.png",
                edit:true),


            );

            }),
            ) : NoDataFoundScreen(fromHome: false): HistoryShimmer(),

            transactionHistory.isLoading ? Center(child: Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
            )) : SizedBox.shrink(),
            ],);



            }),



              ),
            )


          ],
        ),
      ),
    );
  }
}
