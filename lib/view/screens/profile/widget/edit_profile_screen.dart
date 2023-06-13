import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:six_cash/Constants.dart';
import 'package:six_cash/CustomWidgets/ButtonCustom.dart';
import 'package:six_cash/CustomWidgets/FormLabelText.dart';
import 'package:six_cash/CustomWidgets/ImageUpload.dart';
import 'package:six_cash/CustomWidgets/InputField.dart';
import 'package:six_cash/controller/edit_profile_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/camera_screen_controller.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/data/model/body/edit_profile_body.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/view/base/custom_app_bar.dart';
import 'package:six_cash/view/base/custom_small_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController occupationTextController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController paymentcardController = TextEditingController();
  bool switchButton;

  @override
  void initState() {
    super.initState();
    switchButton = false;
    ProfileController profileController = Get.find<ProfileController>();
    //occupationTextController.text = profileController.userInfo.occupation ?? '';
    firstNameController.text = profileController.userInfo.fName ?? '';
    lastNameController.text = profileController.userInfo.lName ?? '';
    emailController.text = profileController.userInfo.email ?? '';
    phoneController.text = profileController.userInfo.phone ?? '';
    fullNameController.text =
        "${profileController.userInfo.fName} ${profileController.userInfo.lName}" ??
            '';
    oldPassController.text = '';
    newPassController.text = '';
    // Get.find<EditProfileController>().setGender(profileController.userInfo.gender ?? 'Male') ;
    // Get.find<EditProfileController>()
    //     .setImage(profileController.userInfo.image ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      return ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        progressIndicator:
            CircularProgressIndicator(color: Theme.of(context).primaryColor),
        child: WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: Scaffold(
            appBar: CustomAppbar(
                title: 'edit_profile'.tr,
                onTap: () {
                  if (Get.find<CameraScreenController>().getImage != null) {
                    Get.find<CameraScreenController>().removeImage();
                  }
                  Get.back();
                }),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                          child: Row(
                            children: [
                              ButtonCustom(
                                buttonText: "Details",
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
                                backgroundColor: switchButton
                                    ? Colors.white
                                    : AqcessColors().primary,
                                foregroundColor: switchButton
                                    ? AqcessColors().primary
                                    : Colors.white,
                              ),
                              ButtonCustom(
                                buttonText: "Account",
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
                                backgroundColor: switchButton
                                    ? AqcessColors().primary
                                    : Colors.white,
                                foregroundColor: switchButton
                                    ? Colors.white
                                    : AqcessColors().primary,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_LARGE,
                        ),
                        switchButton
                            ? Column(
                                children: [
                                  FormLabelText(
                                    labelText: "account_name".tr,
                                  ),
                                  InputField(
                                    placeholderText: "",
                                    fieldController: accountNameController,
                                    suffixIconImage:
                                        "assets/ListTrailingEditIcon.png",
                                    sufficIconPadding: 12,
                                  ),
                                  FormLabelText(labelText: "change_logo".tr),
                                  // Stack(
                                  //   clipBehavior: Clip.none,
                                  //   children: [
                                  //     GetBuilder<CameraScreenController>(
                                  //       builder: (imageController) {
                                  //         return imageController.getImage == null
                                  //             ? GetBuilder<ProfileController>(
                                  //                 builder: (proController) {
                                  //                 return proController.isLoading
                                  //                     ? SizedBox()
                                  //                     : Container(
                                  //                         height: 100,
                                  //                         width: 100,
                                  //                         decoration: BoxDecoration(
                                  //                             borderRadius:
                                  //                                 BorderRadius.circular(
                                  //                                     100)),
                                  //                         child: ClipRRect(
                                  //                           borderRadius:
                                  //                               BorderRadius.circular(
                                  //                                   100),
                                  //                           child: CustomImage(
                                  //                               placeholder:
                                  //                                   Images.avatar,
                                  //                               height: 100,
                                  //                               width: 100,
                                  //                               fit: BoxFit.cover,
                                  //                               image:
                                  //                                   '${Get.find<SplashController>().configModel.baseUrls.customerImageUrl}/${proController.userInfo.image == null ? '' : proController.userInfo.image}'),
                                  //                         ),
                                  //                       );
                                  //               })
                                  //             : Container(
                                  //                 height: 100,
                                  //                 width: 100,
                                  //                 decoration: BoxDecoration(
                                  //                     shape: BoxShape.circle,
                                  //                     border: Border.all(
                                  //                         color: Theme.of(context)
                                  //                             .textTheme
                                  //                             .titleLarge
                                  //                             .color,
                                  //                         width: 2),
                                  //                     image: DecorationImage(
                                  //                       fit: BoxFit.cover,
                                  //                       image: FileImage(
                                  //                         File(imageController
                                  //                             .getImage.path),
                                  //                       ),
                                  //                     )),
                                  //               );
                                  //       },
                                  //     ),
                                  //     Positioned(
                                  //       bottom: 5,
                                  //       right: -5,
                                  //       child: InkWell(
                                  //         onTap: () => Get.find<AuthController>()
                                  //             .requestCameraPermission(
                                  //                 fromEditProfile: true),
                                  //         child: Container(
                                  //           padding: const EdgeInsets.all(5),
                                  //           decoration: BoxDecoration(
                                  //               shape: BoxShape.circle,
                                  //               color: Theme.of(context).cardColor,
                                  //               boxShadow: [
                                  //                 BoxShadow(
                                  //                   color: ColorResources.getShadowColor()
                                  //                       .withOpacity(0.08),
                                  //                   blurRadius: 20,
                                  //                   offset: const Offset(0, 3),
                                  //                 )
                                  //               ]),
                                  //           child: Icon(
                                  //             Icons.camera_alt,
                                  //             size: 24,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  // const SizedBox(
                                  //   height: Dimensions.PADDING_SIZE_LARGE,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: Dimensions.PADDING_SIZE_LARGE),
                                  //   child: GenderView(fromEditProfile: true),
                                  // ),
                                  // InputSection(
                                  //   occupationController: occupationTextController,
                                  //   fNameController: firstNameController,
                                  //   lNameController: lastNameController,
                                  //   emailController: emailController,
                                  // ),

                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                                    child: ImageUploadWidget(
                                      coloredText: "an_image".tr,
                                      plainText: "add_image".tr,
                                      inLineTextColor: Colors.grey,
                                    ),
                                  ),
                                  FormLabelText(
                                    labelText: "payment_method".tr,
                                  ),
                                  InputField(
                                    placeholderText: "XXXX XXXX XXXX 8895",
                                    fieldController: paymentcardController,
                                    suffixIconImage: 'assets/Visa.png',
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 5, 0, 0),
                                        child: RichText(
                                          textAlign: TextAlign.left,
                                          text: TextSpan(
                                            text: 'billing_cycle'.tr,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'May 15th 2023',
                                                style: TextStyle(
                                                  color: Colors
                                                      .blue, // Replace with your desired color
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  FormLabelText(
                                    labelText: "fullname".tr,
                                  ),
                                  InputField(
                                    placeholderText: "",
                                    fieldController: fullNameController,
                                    suffixIconImage:
                                        "assets/ListTrailingEditIcon.png",
                                    sufficIconPadding: 12,
                                  ),
                                  FormLabelText(
                                    labelText: "email".tr,
                                  ),
                                  InputField(
                                    placeholderText: "",
                                    fieldController: emailController,
                                    suffixIconImage:
                                        "assets/ListTrailingEditIcon.png",
                                    sufficIconPadding: 12,
                                  ),
                                  FormLabelText(
                                    labelText: "phone".tr,
                                  ),
                                  InputField(
                                    placeholderText: "",
                                    fieldController: phoneController,
                                    suffixIconImage:
                                        "assets/ListTrailingEditIcon.png",
                                    sufficIconPadding: 12,
                                  ),
                                  FormLabelText(
                                    labelText: "current_pass".tr,
                                    paddingtop: 75,
                                  ),
                                  InputField(
                                    placeholderText:
                                        "current_pass_placeholder".tr,
                                    fieldController: oldPassController,
                                    sufficIconPadding: 12,
                                  ),
                                  FormLabelText(
                                    labelText: "New Password",
                                  ),
                                  InputField(
                                    placeholderText: "Type your New Password",
                                    fieldController: newPassController,
                                    sufficIconPadding: 12,
                                  ),
                                ],
                              )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.PADDING_SIZE_DEFAULT,
                    right: Dimensions.PADDING_SIZE_DEFAULT,
                    bottom: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomSmallButton(
                          onTap: () => _saveProfile(controller),
                          backgroundColor: AqcessColors().primary,
                          text: 'save'.tr,
                          textColor: AqcessColors().secondary,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Future _onWillPop(BuildContext context) async {
    if (Get.find<CameraScreenController>().getImage != null) {
      Get.find<CameraScreenController>().removeImage();
      print('====> Remove image from controller');
      return Get.back();
    } else {
      return Get.back();
    }
  }

  _saveProfile(EditProfileController controller) {
    String _fName = firstNameController.text;
    String _lName = lastNameController.text;
    String _email = emailController.text;
    String _gender = controller.gender;
    String _occupation = occupationTextController.text;
    File _image = Get.find<CameraScreenController>().getImage;

    List<MultipartBody> _multipartBody;
    if (_image != null) {
      _multipartBody = [MultipartBody('image', _image)];
    }
    // if (oldPassController.text != null || newPassController.text != null) {
    //   controller.changePin(
    //       oldPassword: oldPassController.text,
    //       confirmPassword: newPassController.text,
    //       newPassword: newPassController.text);
    // }
    else {
      _multipartBody = [];
    }

    EditProfileBody editProfileBody = EditProfileBody(
      fName: _fName,
      lName: _lName,
      gender: _gender,
      occupation: _occupation,
      email: _email,
    );
    controller.updateProfileData(editProfileBody, _multipartBody).then((value) {
      if (value) {
        Get.find<ProfileController>().profileData();
      }
    });
  }
}

