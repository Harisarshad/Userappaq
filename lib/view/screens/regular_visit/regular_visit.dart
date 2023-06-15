import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/DropDownInputField.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/CustomWidgets/UserReservationsLists.dart';

import '../../../controller/amenties_controller.dart';
import '../../../controller/splash_controller.dart';
import '../../../data/model/amenity_model.dart';
import '../../../util/dimensions.dart';
import '../../base/no_data_screen.dart';
import '../history/widget/history_shimmer.dart';
import 'booking_modalSheet.dart';

class UserReservations extends StatefulWidget {
  UserReservations({Key key}) : super(key: key);

  @override
  State<UserReservations> createState() => _UserReservationsState();
}

class _UserReservationsState extends State<UserReservations> {
  bool switchButton;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController bookingDate = TextEditingController();
  final TextEditingController startTime = TextEditingController();
  final TextEditingController endTime = TextEditingController();

  @override
  void initState() {
    _loadData(context, false);
    super.initState();

    switchButton = false;
  }

  Future<void> _loadData(BuildContext context, bool reload) async {
    Get.find<AmenitiesController>().getAmenitiesforMe(1, reload: true);
    Get.find<AmenitiesController>().getAmenitiesBookingforME(1, reload: true);
  }

  @override
  void dispose() {
    bookingDate.dispose();
    startTime.dispose();
    endTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "My Bookings",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonCustom(
                      buttonText: "New Booking",
                      onPress: () {
                        setState(() {
                          switchButton = true;
                        });
                      },
                      width: MediaQuery.of(context).size.width -
                          17 -
                          MediaQuery.of(context).size.width / 2,
                      paddingRight: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      elevation: 0,
                      backgroundColor:
                          switchButton ? AqcessColors().primary : Colors.white,
                      foregroundColor:
                          switchButton ? Colors.white : AqcessColors().primary,
                    ),
                    ButtonCustom(
                      buttonText: "My Bookings",
                      onPress: () {
                        setState(() {
                          switchButton = false;
                        });
                      },
                      width: MediaQuery.of(context).size.width -
                          17 -
                          MediaQuery.of(context).size.width / 2,
                      paddingRight: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      elevation: 0,
                      backgroundColor:
                          switchButton ? Colors.white : AqcessColors().primary,
                      foregroundColor:
                          switchButton ? AqcessColors().primary : Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            switchButton
                ? Column(
                    children: [
                      FormLabelText(
                        labelText: "Select the amenity you wish to book",
                        fontSize: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: SingleChildScrollView(
                          child: GetBuilder<AmenitiesController>(
                              builder: (transactionHistory) {
                            List<AmenityData> transactionList =
                                transactionHistory.contactList;

                            return Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                !transactionHistory.firstLoading
                                    ? transactionList.length != 0
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL),
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    transactionList.length,
                                                itemBuilder: (ctx, index) {
                                                  return Column(
                                                    children: [
                                                      FormLabelText(
                                                        labelText:
                                                            transactionList[
                                                                    index]
                                                                .name,
                                                        paddingtop: 0,
                                                        textWeight:
                                                            FontWeight.w700,
                                                        paddingbottom: 0,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          print(
                                                              "Amenity Tapped");
                                                          print(transactionList[
                                                                  index]
                                                              .id);
                                                          bookingBottomSheet(
                                                            context: context,
                                                            id: transactionList[
                                                                    index]
                                                                .id,
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(16, 10,
                                                                  16, 10),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            child:
                                                                Image.network(
                                                              '${Get.find<SplashController>().configModel.baseUrls.amenityImageUrl}/${transactionList[index].image == null ? '' : transactionList[index].image}',
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(),
                                                    ],
                                                  );
                                                }),
                                          )
                                        : NoDataFoundScreen(fromHome: false)
                                    : HistoryShimmer(),
                                transactionHistory.isLoading
                                    ? Center(
                                        child: Padding(
                                        padding: EdgeInsets.all(
                                            Dimensions.PADDING_SIZE_DEFAULT),
                                        child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Theme.of(context)
                                                        .primaryColor)),
                                      ))
                                    : SizedBox.shrink(),
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        height: 50,
                        color: AqcessColors().primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 80, 0),
                              child: FormLabelText(
                                labelText: "Amenity Name",
                                TextColor: Colors.white,
                                paddingtop: 0,
                                paddingbottom: 0,
                                paddingleft: 0,
                                paddingright: 0,
                              ),
                            ),
                            FormLabelText(
                              labelText: "Date and Time",
                              TextColor: Colors.white,
                              paddingtop: 0,
                              paddingbottom: 0,
                              paddingleft: 20,
                              paddingright: 0,
                            ),
                          ],
                        ),
                      ),
                      UserReservationsLists(
                        name: "John Doe Sharma",
                        date: "23/28/26",
                        time: "10:25 Am",
                        wholePadding: 12,
                      ),
                      Divider(),
                      UserReservationsLists(
                        name: "John Doe Sharma",
                        date: "23/28/26",
                        time: "10:25 Am",
                        wholePadding: 12,
                      ),
                      Divider(),
                      UserReservationsLists(
                        name: "John Doe Sharma",
                        date: "23/28/26",
                        time: "10:25 Am",
                        wholePadding: 12,
                      ),
                      Divider(),
                      UserReservationsLists(
                        name: "John Doe Sharma",
                        date: "23/28/26",
                        time: "10:25 Am",
                        wholePadding: 12,
                      ),
                      Divider(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class BookAreas extends StatefulWidget {
  const BookAreas({Key key}) : super(key: key);

  @override
  State<BookAreas> createState() => _BookAreasState();
}

class _BookAreasState extends State<BookAreas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomTextAppBar(
        titleText: "Book Amenity",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    ButtonCustom(
                      buttonText: "New Booking",
                      onPress: () {},
                      width: MediaQuery.of(context).size.width -
                          17 -
                          MediaQuery.of(context).size.width / 2,
                      paddingRight: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      elevation: 0,
                      backgroundColor: AqcessColors().primary,
                      foregroundColor: Colors.white,
                    ),
                    ButtonCustom(
                      buttonText: "My Bookings",
                      onPress: () {},
                      width: MediaQuery.of(context).size.width -
                          17 -
                          MediaQuery.of(context).size.width / 2,
                      paddingRight: 0,
                      paddingTop: 0,
                      paddingBottom: 0,
                      paddingLeft: 0,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      foregroundColor: AqcessColors().primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
