import 'dart:io';

import 'package:get/get.dart';
import 'package:six_cash/Constants.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/auth_controller.dart';
import '../controller/camera_screen_controller.dart';
import '../controller/profile_screen_controller.dart';
import '../controller/splash_controller.dart';
import '../util/color_resources.dart';
import '../util/images.dart';
import '../view/base/custom_image.dart';

class ImageUploadWidget extends StatefulWidget {
  final String imagePath;
  final Color containerColor;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Color inLineTextColor;
  final String plainText;
  final String coloredText;
  const ImageUploadWidget(
      {Key key,
      this.imagePath = "assets/Upload.png",
      this.containerColor = const Color.fromARGB(255, 29, 113, 247),
      this.backgroundColor = Colors.white,
      this.borderColor = Colors.grey,
      this.textColor = Colors.grey,
      this.plainText,
      this.coloredText,
      this.inLineTextColor = Colors.blue})
      : super(key: key);
  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  File _pickedImage;

  Future<void> _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        Get.find<CameraScreenController>().setImage(_pickedImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(8),
      dashPattern: [10, 10],
      color: widget.borderColor,
      strokeWidth: 1,
      child:          Stack(
        clipBehavior: Clip.none,
        children: [
          GetBuilder<CameraScreenController>(
            builder: (imageController) {
              return imageController.getImage == null
                  ? GetBuilder<ProfileController>(
                      builder: (proController) {
                      return proController.isLoading
                          ? SizedBox()
                          : Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(
                                          100)),
                              child: CustomImage(
                                  placeholder:
                                      Images.avatar,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  image:
                                      '${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${proController.userInfo.image == null ? '' : proController.userInfo.image}'),
                            );
                    })
                  : Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  .color,
                              width: 2),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                              File(imageController
                                  .getImage.path),
                            ),
                          )),
                    );
            },
          ),
          Positioned(
            bottom: 5,
            right: -5,
            child: InkWell(
              onTap: () => _openGallery(context),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.getShadowColor()
                            .withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Icon(
                  Icons.camera_alt,
                  size: 24,
                ),
              ),
            ),
          )
        ],
      ),



      // Container(
      //   decoration: BoxDecoration(
      //     color: widget.backgroundColor,
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8),
      //     ),
      //   ),
      //   width: 400,
      //   height: 120,
      //   child: _pickedImage != null
      //       ? Image.file(
      //           _pickedImage,
      //         )
      //       : Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             GestureDetector(
      //               onTap: () => _openGallery(context),
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   color: widget.containerColor,
      //                   borderRadius: BorderRadius.all(Radius.circular(50)),
      //                 ),
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(12),
      //                   child: Image.asset(
      //                     widget.imagePath,
      //                     width: 30,
      //                     height: 30,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(height: 10),
      //             InkWell(
      //               onTap: () => _openGallery(context),
      //               child: RichText(
      //                 text: TextSpan(
      //                   text: widget.plainText,
      //                   style: TextStyle(
      //                     color: widget.textColor,
      //                     fontSize: 16,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                   children: [
      //                     TextSpan(
      //                       text: widget.coloredText,
      //                       style: TextStyle(
      //                           color: widget
      //                               .inLineTextColor // Replace with your desired color
      //                           ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      // ),
    );
  }
}
