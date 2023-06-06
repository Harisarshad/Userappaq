import 'package:flutter/material.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/AccessHistoryLists.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';

class AccessHistory extends StatefulWidget {
  const AccessHistory({Key key}) : super(key: key);

  @override
  State<AccessHistory> createState() => _AccessHistoryState();
}

class _AccessHistoryState extends State<AccessHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 200,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_left_outlined,
                  ),
                ),
              ),
               Text(
                "Back",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title:  Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 65, 0),
          child: Text("Access History"),
        )),
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
                    labelText: "Visitor",
                    TextColor: Colors.white,
                    paddingtop: 0,
                    paddingbottom: 0,
                    paddingleft: 0,
                    paddingright: 0,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccessHistoryLists(
                        name: "John Doe Sharma",
                        date: "23/05/2023",
                        time: "10:54 Am"),
                    Divider(),
                    AccessHistoryLists(
                        name: "John Doe Sharma",
                        date: "23/05/2023",
                        time: "10:54 Am"),
                    Divider(),
                    AccessHistoryLists(
                        name: "John Doe Sharma",
                        date: "23/05/2023",
                        time: "10:54 Am"),
                    Divider(),
                    AccessHistoryLists(
                        name: "John Doe Sharma",
                        date: "23/05/2023",
                        time: "10:54 Am"),
                    Divider(),
                    AccessHistoryLists(
                        name: "John Doe Sharma",
                        date: "23/05/2023",
                        time: "10:54 Am"),
                    Divider()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
