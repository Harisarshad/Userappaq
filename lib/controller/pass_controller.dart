
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_number/phone_number.dart';
import 'package:six_cash/controller/bootom_slider_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/controller/camera_screen_controller.dart';
import 'package:six_cash/controller/screen_shot_widget_controller.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/controller/verification_controller.dart';
import 'package:six_cash/data/api/api_checker.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/data/model/body/pass_body.dart';
import 'package:six_cash/data/model/body/signup_body.dart';
import 'package:six_cash/data/model/pass_model.dart';
import 'package:six_cash/data/model/response/response_model.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/util/app_constants.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';

import '../data/repository/pass_repo.dart';

class PassController extends GetxController implements GetxService {
  final PassRepo passRepo;
  PassController({@required this.passRepo}) {
    //_biometric = authRepo.isBiometricEnabled();
   // checkBiometricSupport();
  }

    bool _isLoading = false;
    bool _isVerifying = false;
    bool _biometric = true;
    bool _isBiometricSupported = false;
    // List<BiometricType> _bioList = [];
    // List<BiometricType> get bioList => _bioList;

    bool get isLoading => _isLoading;
    bool get isVerifying => _isVerifying;
    bool get biometric => _biometric;
    bool get isBiometricSupported => _isBiometricSupported;


  bool _isSearching = false;
  bool _isSearchingPending = false;
  int _pageSize;
  int _pageSizePending;
  Pass _passDetailsModel;
  Pass get passDetailsModel => _passDetailsModel;

  bool _firstLoading = true;
  bool _isLoadingPending = false;
  bool _firstLoadingPending = true;
  bool get firstLoading => _firstLoading;
  bool get firstLoadingPending => _firstLoadingPending;
  int _offset = 1;
  int get offset =>_offset;

  List<int> _offsetList = [];
  List<int> _offsetListPending = [];
  List<int> get offsetList => _offsetList;
  List<int> get offsetListPending => _offsetListPending;
  bool _isDetails = false;
  bool get isDetails =>_isDetails;
  List<Pass> _passList  = [];

  List<Pass> get passList => _passList;

    // Future<void> _callSetting() async {
    //   final LocalAuthentication _bioAuth = LocalAuthentication();
    //   _bioList = await _bioAuth.getAvailableBiometrics();
    //   if(_bioList.isEmpty){
    //     try{
    //       AppSettings.openLockAndPasswordSettings();
    //     }catch(e){
    //     }
    //   }
    // }

    Future<void> updatePin(String pin) async {
      await passRepo.writeSecureData(AppConstants.BIOMETRIC_PIN, pin);
    }

  //   bool setBiometric(bool isActive) {
  //     _callSetting().then((value) {
  //       _callSetting();
  //     });
  //
  //     final String _pin = Get.find<BottomSliderController>().pin;
  //     Get.find<ProfileController>().pinVerify(getPin: _pin, isUpdateTwoFactor: false).then((response) async {
  //       if(response.statusCode == 200 && response.body != null) {
  //         _biometric = isActive;
  //         authRepo.setBiometric(isActive && _bioList.isNotEmpty);
  //         try{
  //           await authRepo.writeSecureData(AppConstants.BIOMETRIC_PIN, _pin);
  //         }catch(error) {
  //         }
  //         Get.back(closeOverlays: true);
  //         update();
  //       }
  //     });
  //
  //   return _biometric;
  // }



  // Future<void> authenticateWithBiometric(bool autoLogin, String pin) async {
  //   final LocalAuthentication _bioAuth = LocalAuthentication();
  //   _bioList = await _bioAuth.getAvailableBiometrics();
  //   if((await _bioAuth.canCheckBiometrics || await _bioAuth.isDeviceSupported()) && authRepo.isBiometricEnabled()) {
  //     final List<BiometricType> _availableBiometrics = await _bioAuth.getAvailableBiometrics();
  //     if (_availableBiometrics.isNotEmpty && (!autoLogin || await biometricPin() != '')) {
  //       try {
  //         final bool _didAuthenticate = await _bioAuth.authenticate(
  //           localizedReason: autoLogin ? 'please_authenticate_to_login'.tr : 'please_authenticate_to_easy_access_for_next_time'.tr,
  //           options: AuthenticationOptions(stickyAuth: true, biometricOnly: true),
  //         );
  //         if(_didAuthenticate) {
  //           if(autoLogin) {
  //             login(code: getCustomerCountryCode(), phone: getCustomerNumber(), password: await biometricPin());
  //           }else{
  //             authRepo.writeSecureData(AppConstants.BIOMETRIC_PIN, pin);
  //           }
  //         }else{
  //           if(pin != null) {
  //             authRepo.setBiometric(false);
  //           }
  //         }
  //       } catch(e) {
  //       }
  //     }else{
  //      // _checkBiometricWithPin();
  //     }
  //   }
  // }
  // void checkBiometricSupport() async {
  //   final LocalAuthentication _bioAuth = LocalAuthentication();
  //   _isBiometricSupported = await _bioAuth.canCheckBiometrics || await _bioAuth.isDeviceSupported();
  // }






  // registration ..
  // Future<Response> registrationhome(SignUpBody signUpBody) async{
  //   _isLoading = true;
  //   update();
  //   Map<String, String> _allCustomerInfo = {
  //     'f_name': signUpBody.fName,
  //     'l_name': signUpBody.lName,
  //     'phone': signUpBody.phone,
  //     'dial_country_code': signUpBody.dialCountryCode,
  //     'password': signUpBody.password,
  //     'gender': signUpBody.gender,
  //     'occupation': signUpBody.occupation,
  //   };
  //   if(signUpBody.otp != null) {
  //     _allCustomerInfo.addAll({'otp': signUpBody.otp});
  //   }
  //   if(signUpBody.email != '') {
  //     _allCustomerInfo.addAll({'email': signUpBody.email});
  //   }
  //
  //   Response response = await authRepo.registrationhome(_allCustomerInfo);
  //   print('error is');
  //   if (response.statusCode == 200) {
  //     Get.find<CameraScreenController>().removeImage();
  //     String _countryCode, _nationalNumber;
  //     try{
  //       PhoneNumber _phoneNumber = await PhoneNumberUtil().parse(signUpBody.phone);
  //       _countryCode = '+' + _phoneNumber.countryCode;
  //       _nationalNumber = _phoneNumber.nationalNumber;
  //     }catch(e){}
  //     setCustomerCountryCode(_countryCode);
  //     setCustomerNumber(_nationalNumber);
  //     _login(signUpBody.email,signUpBody.password);
  //     Get.offAllNamed(RouteHelper.getWelcomeRoute(
  //         countryCode: getCustomerCountryCode(),phoneNumber: getCustomerNumber(), password: signUpBody.password
  //     ));
  //
  //     // authenticateWithBiometric(false, signUpBody.password).then((value) {
  //     //   Future.delayed(Duration(seconds: 1)).then((value) {
  //     //     _callSetting();
  //     //
  //     //   });
  //     // });
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }
  //   _isLoading = false;
  //   update();
  //   return response;
  // }
  // Future<void> _login(String phone,String password) async {
  //
  //
  //   String _phone = phone;
  //   String _password = password;
  //   String _code ='';
  //   Get.find<AuthController>().login(code: _code,phone: _phone,password: _password).then((value) async{
  //     if(value.isOk){
  //       print(value.toString());
  //       print('value.toString()');
  //       // Map map = value;
  //       // String temporaryToken = '';
  //       // String token = '';
  //       // String message = '';
  //       // // String token = map["token"];
  //       //
  //       // try{
  //       //   message = map["message"];
  //       //
  //       // }catch(e){
  //       //
  //       // }
  //       // try{
  //       //   token = map["token"];
  //       //
  //       // }catch(e){
  //       //
  //       // }
  //       // try{
  //       //   temporaryToken = map["temporary_token"];
  //       //
  //       // }catch(e){
  //       //
  //       // }
  //       //
  //       // if(token != null && token.isNotEmpty){
  //       //   authRepo.saveUserToken(token);
  //       //   await authRepo.updateToken();
  //       // }
  //       await Get.find<ProfileController>().profileData(reload: true);
  //
  //     }
  //   });
  //   // if (_phone.isEmpty) {
  //   //   showCustomSnackBar('please_give_your_email_number'.tr,  isError: true);
  //   // } else if (_password.isEmpty) {
  //   //   showCustomSnackBar('please_give_your_pass_number'.tr,  isError: true);
  //   // }
  //   // else {
  //   //
  //   //
  //   //   try{
  //   //     //PhoneNumber num = await PhoneNumberUtil().parse(_phoneNumber);
  //   //     // print('+${num.countryCode}');
  //   //     // print(num.nationalNumber);
  //   //     Get.find<AuthController>().login(code: _code,phone: _phone,password: _password).then((value) async{
  //   //       if(value.isOk){
  //   //         await Get.find<ProfileController>().profileData(reload: true);
  //   //       }
  //   //     });
  //   //   }catch(e){
  //   //     print(e);
  //   //     showCustomSnackBar('please_give_your_email_number'.tr,isError: true);
  //   //   }
  //   // }
  // }
  Future getContactsData(int offset,{bool reload = false}) async{
    if(reload) {
      _offsetList = [];
      _passList = [];

    }
    _offset = offset;
    if(!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      Response response = await passRepo.getPass(offset);
      if(response.body['transactions'] != null && response.body['transactions'] != {} && response.statusCode==200){
        _passList = [];

        response.body['transactions'].forEach((transactionHistory) {
          Pass history = Pass.fromJson(transactionHistory);
          _passList.add(history);
        });
        _pageSize = PassModel.fromJson(response.body).totalSize;
      }else{
        ApiChecker.checkApi(response);
      }
    }
    _isLoading = false;
    _firstLoading = false;
    update();
  }
  Future<Response> passDetails(String id, BuildContext context ) async{

    update();

    _isDetails = true;



    Response response = await passRepo.pass(id);
    print('error is');
    if (response.statusCode == 200) {
      _isDetails = false;
      _passDetailsModel = Pass.fromJson(response.body['pass']);

      // Get.offAllNamed(RouteHelper.getWelcomeRoute(
      //   countryCode: getCustomerCountryCode(),phoneNumber: getCustomerNumber(), password: signUpBody.password
      // ));
      // authenticateWithBiometric(false, signUpBody.password).then((value) {
      //   Future.delayed(Duration(seconds: 1)).then((value) {
      //     _callSetting();
      //
      //   });
      // });
    } else {
      _isDetails = false;

      ApiChecker.checkApi(response);
    }
    _isDetails = false;

    update();
    return response;
  }
  Future<Response> registration(PassBody signUpBody ,BuildContext context ) async{
      _isLoading = true;
      update();
      Map<String, String> _allCustomerInfo =

      {
        'full_name': signUpBody.fullName,

        'phone': signUpBody.phone,
        'save': signUpBody.save.toString(),
        'reason': signUpBody.reason,
        'user_id':signUpBody.userId,
        'permanent': signUpBody.permanent.toString(),
        'date': signUpBody.date,
        'startDate': signUpBody.startDate,
        'endDate': signUpBody.endDate,

      };



      Response response = await passRepo.registrationhome(_allCustomerInfo);
      print('error is');
      if (response.statusCode == 200) {
        //Navigator.pop(context);
        String _countryCode, _nationalNumber;
        print(response.body);
        print('harisarshad');


        print('harisarshad');
        String idofpass =response.body['transaction_id'].toString();
        String qrcode =response.body['qr_code'];

        Get.find<ScreenShootWidgetController>().qrCodeDownloadAndShare(qrCode: qrcode, phoneNumber: idofpass,isShare: true);

        // Get.offAllNamed(RouteHelper.getWelcomeRoute(
        //   countryCode: getCustomerCountryCode(),phoneNumber: getCustomerNumber(), password: signUpBody.password
        // ));
        // authenticateWithBiometric(false, signUpBody.password).then((value) {
        //   Future.delayed(Duration(seconds: 1)).then((value) {
        //     _callSetting();
        //
        //   });
        // });
      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
      return response;
  }

  Future<Response> addContact(String name,String email,String type,String phone, BuildContext context ) async{
    _isLoading = true;
    update();
    Map<String, String> _allCustomerInfo =

    {
      'name': name,

      'email': email,
      'phone': phone,
      'type': type,


    };



    Response response = await passRepo.addContact(_allCustomerInfo);
    print('error is');
    if (response.statusCode == 200) {

      Navigator.pop(context);

      // Get.offAllNamed(RouteHelper.getWelcomeRoute(
      //   countryCode: getCustomerCountryCode(),phoneNumber: getCustomerNumber(), password: signUpBody.password
      // ));
      // authenticateWithBiometric(false, signUpBody.password).then((value) {
      //   Future.delayed(Duration(seconds: 1)).then((value) {
      //     _callSetting();
      //
      //   });
      // });
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
    return response;
  }
  Future<Response> updateContact(String name,String email,String type,String phone,String id, BuildContext context ) async{
    _isLoading = true;
    update();
    Map<String, String> _allCustomerInfo =

    {
      'id': id,

      'name': name,

      'email': email,
      'phone': phone,
      'type': type,


    };



    Response response = await passRepo.updateContact(_allCustomerInfo);
    print('error is');
    if (response.statusCode == 200) {

      Navigator.pop(context);

      // Get.offAllNamed(RouteHelper.getWelcomeRoute(
      //   countryCode: getCustomerCountryCode(),phoneNumber: getCustomerNumber(), password: signUpBody.password
      // ));
      // authenticateWithBiometric(false, signUpBody.password).then((value) {
      //   Future.delayed(Duration(seconds: 1)).then((value) {
      //     _callSetting();
      //
      //   });
      // });
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
    return response;
  }
  Future<Response> deleteContact(String id, BuildContext context ) async{
    _isLoading = true;
    update();




    Response response = await passRepo.deleteContact(id);
    print('error is');
    if (response.statusCode == 200) {

      Navigator.pop(context);

      // Get.offAllNamed(RouteHelper.getWelcomeRoute(
      //   countryCode: getCustomerCountryCode(),phoneNumber: getCustomerNumber(), password: signUpBody.password
      // ));
      // authenticateWithBiometric(false, signUpBody.password).then((value) {
      //   Future.delayed(Duration(seconds: 1)).then((value) {
      //     _callSetting();
      //
      //   });
      // });
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
    return response;
  }

  Future removeUser() async {

    _isLoading = true;
    update();
    Get.back();
    Response response = await passRepo.deleteUser();
    print('user del : ${response.body}');

    if (response.statusCode == 200) {
      Get.find<SplashController>().removeSharedData().then((value) {
        showCustomSnackBar('your_account_remove_successfully'.tr);
        Get.offAllNamed(RouteHelper.getSplashRoute());
      });
    }else{
      Get.back();
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }


  Future<Response> checkOtp()async{
      _isLoading = true;
      update();
      Response  response = await passRepo.checkOtpApi();
      if(response.statusCode == 200){
        _isLoading = false;
      }else{
        _isLoading = false;
        ApiChecker.checkApi(response);
      }
      update();
      return response;
  }

  Future<Response> verifyOtp(String otp)async{
    _isVerifying = true;
    update();
    Response  response = await passRepo.verifyOtpApi(otp: otp);
    if(response.statusCode == 200){
      _isVerifying = false;
      Get.back();
    }else{
      Get.back();
      ApiChecker.checkApi(response);
      _isVerifying = false;
    }
    _isVerifying = false;
    update();
    return response;
  }






  String getAuthToken() {
    return passRepo.getUserToken();
  }


  bool isLoggedIn() {
    return passRepo.isLoggedIn();
  }



  PageController pageController = PageController();
  int _page = 0;

  int get page => _page;
  change(int a) {
    _page = a;
    update();
  }
}
