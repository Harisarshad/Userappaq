// import 'package:flutter/material.dart';

// class Tile extends StatelessWidget {
//   const Tile({
//     super.key,
//     required this.primaryColor,
//     required this.secondaryColor,
//     required this.imagePath,
//     required this.text,
//     required this.subText,
//   });
//   final Color primaryColor;
//   final Color secondaryColor;
//   final String imagePath;
//   final String text;
//   final String subText;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       color: primaryColor,
//       margin: const EdgeInsets.all(10),
//       elevation: 8,
//       child: SizedBox(
//         width: 175,
//         height: 138,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   child: Image.asset(
//                     imagePath,
//                     width: 30,
//                     height: 30,
//                   ),
//                 ),
//                 const Spacer(),
//                 Container(
//                   child: Icon(
//                     Icons.keyboard_double_arrow_right_outlined,
//                     size: 30,
//                     color: secondaryColor,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(10, 9, 20, 2),
//                   child: Text(
//                     text,
//                     style: TextStyle(color: secondaryColor, fontSize: 18),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//                   child: Text(
//                     subText,
//                     style: TextStyle(color: secondaryColor, fontSize: 12),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  //parameters
  final Color primaryColor;
  final Color secondaryColor;
  final String imagePath;
  final String text;
  final String subText;
  double fontsizePrimaryText = 18;
  double fontsizeSubText = 12;
  GestureTapCallback onPressed;
  //constructor
  Tile({
    Key key,
     this.primaryColor,
     this.secondaryColor,
     this.imagePath,
     this.text,
     this.subText,
    this.fontsizePrimaryText,
    this.fontsizeSubText,
    this.onPressed,
  }) : super(key: key);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: widget.primaryColor,
        margin: const EdgeInsets.all(10),
        elevation: 8,
        child: SizedBox(
          width: 175,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      widget.imagePath,
                      width: 30,
                      height: 30,
                    ),
                    Icon(
                      Icons.keyboard_double_arrow_right_outlined,
                      size: 30,
                      color: widget.secondaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 9, 20, 2),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: widget.secondaryColor,
                      fontSize: widget.fontsizePrimaryText,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.subText,
                    style: TextStyle(
                      color: widget.secondaryColor,
                      fontSize: widget.fontsizeSubText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
