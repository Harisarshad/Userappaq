import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/CustomListTile.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/CustomWidgets/MyCustomTextAppBar.dart';
import 'package:six_cash/view/screens/contacts/add_contact.dart';

class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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
      appBar: MyCustomTextAppBar(
        titleText: "Contacts",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
              placeholderText: "Search",
              fieldController: searchString,
              prefixIconImage: "assets/Search.png",
            ),
            Row(
              children: [
                FormLabelText(labelText: "My Contacts"),
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
                      Get.to(AddContact());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_outlined,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "Add New",
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
                child: Column(
                  children: [
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person1.png",
                    ),
                    CustomListTile(
                      userName: "Rebbecca Moore",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person2.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person3.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person4.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person5.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person2.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person1.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person3.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person4.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person5.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person2.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person1.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person3.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person4.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person5.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person2.png",
                    ),
                    CustomListTile(
                      userName: "John Doe Sharma",
                      userEmail: "Johndoe@mail.com",
                      imagePath: "assets/Person1.png",
                    ),
                  ],
                ),
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
