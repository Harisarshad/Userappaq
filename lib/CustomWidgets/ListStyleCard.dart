import 'package:flutter/material.dart';


/*
TODO Border Radius of the container as of now it throws error upon seting color and decoration.
 */

class ListStyleCard extends StatelessWidget {
  const ListStyleCard({
    Key key,
     this.heading,
     this.subText,
     this.imagePath,
  }) : super(key: key);

  final String heading;
  final String subText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      elevation: 10,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        heading,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      subText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
