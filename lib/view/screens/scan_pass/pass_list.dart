import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/CustomListTile.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/controller/contacts_controller.dart';
import 'package:six_cash/controller/pass_controller.dart';
import 'package:six_cash/data/model/pass_model.dart';
import 'package:six_cash/view/screens/contacts/add_contact.dart';

import '../../../CustomWidgets/PassCustomListTile.dart';
import '../../../controller/screen_shot_widget_controller.dart';
import '../../../data/model/contact_model.dart';
import '../../../helper/route_helper.dart';
import '../../../util/dimensions.dart';
import '../../base/no_data_screen.dart';
import '../history/widget/history_shimmer.dart';
import '../profile/widget/qr_code_download_or_share.dart';

class PassList extends StatefulWidget {
  PassList({Key key}) : super(key: key);

  @override
  State<PassList> createState() => _ContactsState();
}

class _ContactsState extends State<PassList> {
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
    Get.find<PassController>().getContactsData(1, reload: true);
    //  Get.find<TransactionMoneyController>().getWithdrawMethods(isReload: reload);
    //Get.find<RequestedMoneyController>().getWithdrawHistoryList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "My Passes",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // InputField(
            //   placeholderText: "Search",
            //   fieldController: searchString,
            //   prefixIconImage: "assets/Search.png",
            // ),
            Row(
              children: [
                FormLabelText(labelText: "My Passes"),
                Spacer(),
                // Container(
                //   margin: EdgeInsets.fromLTRB(16, 15, 16, 5),
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AqcessColors().primary,
                //       foregroundColor: Colors.white,
                //       elevation: 8,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(8),
                //         ),
                //       ),
                //     ),
                //     onPressed: () {
                //       Get.to(AddContact(update: false,));
                //     },
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.add_outlined,
                //         ),
                //         Padding(
                //           padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                //           child: Text(
                //             "Add New",
                //             style: TextStyle(fontSize: 18),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            Padding(

              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child:  GetBuilder<PassController>(builder: (transactionHistory){
            List<Pass> transactionList = transactionHistory.passList;



            return  Column(children: [!transactionHistory.firstLoading ? transactionList.length != 0 ?
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transactionList.length,
            itemBuilder: (ctx,index){
            return Container(

            child:  InkWell(
              onTap: (){
               // Navigator.pop(context);
                //QrCodeDownloadOrShareScreen

                Get.to(()=>  QrCodeDownloadOrShareScreen( qrCode: transactionList[index].qrCode, phoneNumber: transactionList[index].id, passData:transactionList[index]));
              //  Get.toNamed(RouteHelper.getQrCodeDownloadOrShareRoute(qrCode: transactionList[index].qrCode,phoneNumber: transactionList[index].id));
               // Get.find<ScreenShootWidgetController>().qrCodeDownloadAndShare(qrCode: transactionList[index].qrCode, phoneNumber: transactionList[index].qrCode,isShare: true);
              },
              child: PassCustomListTile(
                cont: transactionList[index],
                  userName: transactionList[index].fullName,
                  userEmail: transactionList[index].date,
                  imagePath: "assets/Person1.png",
                  edit:false),
            ),


            );

            }),
            ) : NoDataFoundScreen(fromHome: false): HistoryShimmer(),

            transactionHistory.isLoading ? Center(child: Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
            )) : SizedBox.shrink(),
            ],);



            }),


                // Column(
                //   children: [
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person1.png",
                //     ),
                //     CustomListTile(
                //       userName: "Rebbecca Moore",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person2.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person3.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person4.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person5.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person2.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person1.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person3.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person4.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person5.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person2.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person1.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person3.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person4.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person5.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person2.png",
                //     ),
                //     CustomListTile(
                //       userName: "John Doe Sharma",
                //       userEmail: "Johndoe@mail.com",
                //       imagePath: "assets/Person1.png",
                //     ),
                //   ],
                // ),
              ),
            )

            // ListView(
            //   children: const <Widget>[
            //     ListTile(
            //       leading: CircleAvatar(child: Text('A')),
            //       title: Text('Headline'),
            //       subtitle: Text('Supporting text'),
            //       trailing: Icon(Icons.favorite_rounded),
            //     ),
            //     Divider(height: 0),
            //     ListTile(
            //       leading: CircleAvatar(child: Text('B')),
            //       title: Text('Headline'),
            //       subtitle: Text(
            //           'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
            //       trailing: Icon(Icons.favorite_rounded),
            //     ),
            //     Divider(height: 0),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
