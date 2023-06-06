import 'package:flutter/material.dart';
import 'package:six_cash/CustomWidgets/CustomListTile.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/CustomWidgets/OnTapCustomListTile.dart';

class Residents extends StatefulWidget {

     Residents({Key key}) : super(key: key);


  @override
  State<Residents> createState() => _ResidentsState();
}

class _ResidentsState extends State<Residents> {
   final TextEditingController searchString = TextEditingController();

  // Overriding them for initializing them
  @override
  void initState() {
    // searchString = TextEditingController();
    super.initState();
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
        child: Column(
          children: [
            InputField(
              placeholderText: "Search",
              fieldController: searchString,
              prefixIconImage: "assets/Search.png",
            ),

            Padding(
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
                  userName: "John Doe Sharma",
                  subText: "Main Street 1001",
                  onTapApprove: () {},
                  onTapReject: () {},
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomListTile(
                    userName: "John Doe Sharma",
                    userEmail: "Johndoe@mail.com",
                    imagePath: "assets/Person1.png",
                  ),
                  CustomListTile(
                    userName: "John Doe Sharma",
                    userEmail: "Johndoe@mail.com",
                    imagePath: "assets/Person2.png",
                  ),
                  CustomListTile(
                    userName: "John Doe Sharma",
                    userEmail: "Johndoe@mail.com",
                    imagePath: "assets/Person3.png",
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}