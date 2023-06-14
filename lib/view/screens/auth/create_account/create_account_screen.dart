

import 'package:phone_number/phone_number.dart';
import 'package:six_cash/controller/auth_controller.dart';
import 'package:six_cash/controller/create_account_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/custom_app_bar.dart';
import 'package:six_cash/view/base/custom_country_code_picker.dart';
import 'package:six_cash/view/base/custom_logo.dart';
import 'package:six_cash/view/base/custom_large_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';

import '../../../../Constants.dart';
import '../../../../CustomWidgets/DropDownInputField.dart';
import '../../../../CustomWidgets/FormLabelText.dart';
import '../../../../CustomWidgets/InputField.dart';
import '../../../../controller/camera_screen_controller.dart';
import '../../../../controller/verification_controller.dart';
import '../../../../data/api/api_client.dart';
import '../../../../data/model/body/signup_body.dart';
import '../../../../helper/route_helper.dart';

class CreateAccountScreen extends StatefulWidget {
  final String countryCode;
  const CreateAccountScreen({Key key, this.countryCode, }) : super(key: key);
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController numberFieldController = TextEditingController();



   final TextEditingController userFullName =  TextEditingController();
   final TextEditingController JoingCode =  TextEditingController();

   final TextEditingController userEmail=  TextEditingController();

   final TextEditingController userPassword=  TextEditingController();

   final TextEditingController userConfirmPassword=  TextEditingController();

   final TextEditingController userResidents=  TextEditingController();
   final TextEditingController numberOfResidents=  TextEditingController();

  final _formKey = GlobalKey<FormState>();
String userType;
  // Overriding them for initializing them
  @override
  void initState() {
   // Get.find<CreateAccountController>().setInitCountryCode(Get.find<SplashController>().getCountryCode());

    userType = widget.countryCode;
    super.initState();
  }

// Dont forget to Dispose !!
  @override
  void dispose() {
    userEmail.dispose();
    userPassword.dispose();
    userFullName.dispose();
    JoingCode.dispose();
    userConfirmPassword.dispose();
    userResidents.dispose();
    numberOfResidents.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getWhiteAndBlack(),
      appBar: AppBar(
        title: Center(
          child: Text(
            "create_an_account".tr,
            style: TextStyle(fontSize: 20),
          ),
        ),
        bottom: PreferredSize(
          preferredSize:  Size.fromHeight(4.0),
          child: Divider(color: Colors.grey.shade400),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 25),
                        child: Image.asset(
                          "assets/Aqcess-Logo.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Text(
                        "welcome".tr,
                        style: TextStyle(fontSize: 24),
                      ),
                      Center(
                        child: Text(
                          "create_or_register".tr,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                         FormLabelText(
                          labelText: "building_code".tr,
                        ),
                        InputField(
                          placeholderText: "building_placeholder".tr,
                          fieldController: JoingCode,
                        ),
                         FormLabelText(
                          labelText: "fullname".tr,
                        ),
                        InputField(
                          placeholderText: "fullname_placeholder".tr,
                          fieldController: userFullName,
                        ),

                         FormLabelText(
                          labelText: "email".tr,
                        ),
                        InputField(
                          placeholderText: "email_placeholder".tr,
                          fieldController: userEmail,
                        ),
                         FormLabelText(
                          labelText: "password".tr,
                        ),
                        InputField(
                          placeholderText: "password_placeholder".tr,
                          fieldController: userPassword,
                          obscureText: true,
                        ),
                         FormLabelText(
                          labelText: "confirm_pass".tr,
                        ),
                        InputField(
                          placeholderText: "confirm_pass".tr,
                          fieldController: userConfirmPassword,
                          obscureText: true,
                        ),
                        // const FormLabelText(
                        //   labelText: "Number of residents in your housing complex? ",
                        // ),
                        // Row(
                        //   children: [
                        //     DropdownInputField(
                        //       values: ['100', '200', '300', '400', '500'],
                        //       controller: numberOfResidents,
                        //       placeholder: "200",
                        //       width: 390,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 15, 16, 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AqcessColors().primary,
                        foregroundColor: Colors.white,
                        elevation: 8,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        minimumSize: Size(400, 50),
                      ),
                      onPressed: ()  {

                        if (JoingCode.text == '' || JoingCode.text == '') {
                          showCustomSnackBar('enter_the_code_building'.tr, isError: true);
                        }
                        else if  (userFullName.text == '' || userFullName.text == '') {
                          showCustomSnackBar('first_name_or_last_name'.tr, isError: true);
                        }
                        else {
                          if(userEmail.text != ''){
                            bool _emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(userEmail.text);
                            if(!_emailValid){
                              showCustomSnackBar('please_provide_valid_email'.tr, isError: true);
                            }
                            else{

                              String _password =  userConfirmPassword.text;
                              String _gender =  'male';
                              String _occupation =  'do n';
                              String _fName =  userFullName.text;
                              String _JoingCode =  JoingCode.text;
                              String _lName =  userFullName.text;
                              String _email = userEmail.text;
                              String _countryCode = getCountryCode(Get.find<CreateAccountController>().phoneNumber);
                             // String _phoneNumber = Get.find<CreateAccountController>().phoneNumber.replaceAll(_countryCode, '');
                              String _otp =  Get.find<VerificationController>().otp;

                              SignUpBody signUpBody = SignUpBody(
                                  fName: _fName,
                                  lName: _lName,
                                  gender: _gender,
                                  parentCode: _JoingCode,
                                  occupation: _occupation,
                                  email: _email,
                                  phone: '16546546546',
                                  otp: _otp,
                                  password: _password,
                                  dialCountryCode: _countryCode, userType: userType
                              );

                              //MultipartBody multipartBody = MultipartBody('image',_image );
                              //MultipartBody multipartBody = multipartBody();
                              Get.find<AuthController>().registrationhome(signUpBody,);
                            }
                          }
                          else{
                            showCustomSnackBar('please_provide_valid_email'.tr, isError: true);
                          }
                        }
                      },
                      child: Text(
                        "create_an_account".tr,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(RouteHelper.getLoginRoute(
                        countryCode: Get.find<AuthController>().getCustomerCountryCode(),
                        phoneNumber: Get.find<AuthController>().getCustomerNumber(),
                      ));
                      },
                    child: Text(
                      "login".tr,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE),
                  // CustomLogo(height: Dimensions.BIG_LOGO, width: Dimensions.BIG_LOGO),
                  // const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  // Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  //   child: Text('create_account_description'.tr, style: rubikRegular.copyWith(color: Theme.of(context).textTheme.bodyText1.color, fontSize: Dimensions.FONT_SIZE_LARGE,), textAlign: TextAlign.center,),
                  // ),
                  // const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
                  // GetBuilder<CreateAccountController>(builder: (controller)=>Container(height: 52,
                  //   margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  //   child: Center(
                  //     child: TextField(
                  //       controller: numberFieldController,
                  //       keyboardType: TextInputType.phone,
                  //       cursorColor: Theme.of(context).textTheme.titleLarge.color,
                  //       decoration: InputDecoration(
                  //         contentPadding: const EdgeInsets.only(bottom: 5),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_SMALL),
                  //           borderSide: BorderSide(color: Theme.of(context).textTheme.titleLarge.color, width: 2,
                  //           ),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_SMALL),
                  //           borderSide: BorderSide(color: ColorResources.textFieldBorderColor, width: 1,
                  //           ),
                  //         ),
                  //        prefixIcon: CustomCountryCodePiker(
                  //          onInit: (code){},
                  //          initSelect: controller.countryCode,
                  //          onChanged: (code) => controller.setCountryCode(code),
                  //        ),
                  //
                  //       ),
                  //     ),
                  //   ),
                  // ),),
                ],
              ),
            ),
          ),
          // GetBuilder<AuthController>(builder: (controller)=> Container(
          //   height: 110,
          //   child: !controller.isLoading ? CustomLargeButton(
          //     backgroundColor: Theme.of(context).secondaryHeaderColor,
          //     text: 'verify_umber'.tr,
          //     onTap: () async {
          //       String _phoneNumber = '${Get.find<CreateAccountController>().countryCode}${numberFieldController.text}';
          //       try{
          //         await PhoneNumberUtil().parse(_phoneNumber).then((value) => Get.find<CreateAccountController>().sendOtpResponse(number: _phoneNumber));
          //
          //       }catch(e){
          //         showCustomSnackBar('please_input_your_valid_number'.tr, isError: true);
          //         numberFieldController.clear();
          //       }
          //     },
          //   ) : Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor)),
          // ),),
        ],
      ),
    );
  }
}
