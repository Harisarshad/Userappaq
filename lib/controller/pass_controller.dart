import 'dart:typed_data';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_number/phone_number.dart';
import 'package:screenshot/screenshot.dart';
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
import 'dart:io';

import '../data/repository/pass_repo.dart';
import 'package:share_plus/share_plus.dart';

class PassController extends GetxController implements GetxService {
  final PassRepo passRepo;
  PassController({@required this.passRepo}) {
    //_biometric = authRepo.isBiometricEnabled();
    // checkBiometricSupport();
  }
  ScreenshotController statementController = ScreenshotController();
  bool _isLoading = false;
  bool _isLoadingHistory = false;
  bool _isVerifying = false;
  bool _biometric = true;
  bool _isBiometricSupported = false;
  // List<BiometricType> _bioList = [];
  // List<BiometricType> get bioList => _bioList;

  bool get isLoading => _isLoading;
  bool get isLoadingHistory => _isLoadingHistory;
  bool get isVerifying => _isVerifying;
  bool get biometric => _biometric;
  bool get isBiometricSupported => _isBiometricSupported;

  bool _isSearching = false;
  bool _isSearchingPending = false;
  int _pageSize;
  int _pageSizeHistory;
  int _pageSizePending;
  Pass _passDetailsModel;
  Pass get passDetailsModel => _passDetailsModel;
  Pass _passDetailsModelv;
  Pass get passDetailsModelv => _passDetailsModelv;

  bool _firstLoading = true;
  bool _firstLoadingHistory = true;
  bool _isLoadingPending = false;
  bool _firstLoadingPending = true;
  bool get firstLoading => _firstLoading;
  bool get firstLoadingHistory => _firstLoadingHistory;
  bool get firstLoadingPending => _firstLoadingPending;
  int _offset = 1;
  int get offset => _offset;

  List<int> _offsetList = [];
  List<int> _offsetListPending = [];
  List<int> get offsetList => _offsetList;

  List<int> _offsetListHistory = [];
  List<int> get offsetListHistory => _offsetListHistory;
  List<int> get offsetListPending => _offsetListPending;
  bool _isDetails = false;
  bool get isDetails => _isDetails;
  bool _isDetailsv = false;
  bool get isDetailsv => _isDetailsv;
  List<Pass> _passList = [];
  List<HistoryData> _passHistory = [];

  List<Pass> get passList => _passList;
  List<HistoryData> get passHistory => _passHistory;

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

  Future getContactsData(int offset, {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _passList = [];
    }
    _offset = offset;
    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      Response response = await passRepo.getPass(offset);
      if (response.body['transactions'] != null &&
          response.body['transactions'] != {} &&
          response.statusCode == 200) {
        _passList = [];

        response.body['transactions'].forEach((transactionHistory) {
          Pass history = Pass.fromJson(transactionHistory);
          _passList.add(history);
        });
        _pageSizeHistory = PassModel.fromJson(response.body).totalSize;
      } else {
        ApiChecker.checkApi(response);
      }
    }
    _isLoading = false;
    _firstLoading = false;
    update();
  }

  Future getPassHistory(int offset, {bool reload = false}) async {
    if (reload) {
      _offsetListHistory = [];
      _passHistory = [];
    }
    _offset = offset;
    if (!_offsetListHistory.contains(offset)) {
      _offsetListHistory.add(offset);

      Response response = await passRepo.getHistory(offset);
      if (response.body['transactions'] != null &&
          response.body['transactions'] != {} &&
          response.statusCode == 200) {
        _passHistory = [];

        response.body['transactions'].forEach((transactionHistory) {
          HistoryData history = HistoryData.fromJson(transactionHistory);
          _passHistory.add(history);
        });
        _pageSizeHistory = PassHistory.fromJson(response.body).totalSize;
      } else {
        ApiChecker.checkApi(response);
      }
    }
    _isLoadingHistory = false;
    _firstLoadingHistory = false;
    update();
  }

  Future<Response> passDetails(String id, BuildContext context) async {
    update();

    _isDetails = true;

    Response response = await passRepo.pass(id);
    print('error is');
    if (response.statusCode == 200) {
      _isDetails = false;
      _passDetailsModel = Pass.fromJson(response.body['pass']);
      Uint8List _image;
      // Future.delayed(Duration(milliseconds: 100)).then((value) async {
      //   _image =  await statementController.capture();
      //
      //   Navigator.pop(Get.context);
      //   bool isShare=true;
      //   if(isShare == true){
      //     final _directory = await getApplicationDocumentsDirectory();
      //     final _imageFile = File('${_directory.path}/share.png');
      //     _imageFile.writeAsBytesSync(_image);
      //     await Share.shareFiles([_imageFile.path]);
      //   }else{
      //     final _directory = await getApplicationDocumentsDirectory();
      //     final _imageFile = File('${_directory.path}/qr.png');
      //     _imageFile.writeAsBytesSync(_image);
      //     await GallerySaver.saveImage(_imageFile.path,albumName: 'aqcess',).then((value) => showCustomSnackBar('QR code save to your Gallery',isError: false));
      //   }
      //
      //
      // });

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

  Future<Response> passVerify(String id, BuildContext context) async {
    update();

    _isDetailsv = true;

    Response response = await passRepo.verifyPass(id);
    print('error is');
    if (response.statusCode == 200) {
      _isDetailsv = false;
      _passDetailsModelv = Pass.fromJson(response.body['pass']);
      // Uint8List _image;
      // Future.delayed(Duration(milliseconds: 100)).then((value) async {
      //   _image =  await statementController.capture();

      //   Navigator.pop(Get.context);
      //   bool isShare=true;
      //   if(isShare == true){
      //     final _directory = await getApplicationDocumentsDirectory();
      //     final _imageFile = File('${_directory.path}/share.png');
      //     _imageFile.writeAsBytesSync(_image);
      //     await Share.shareFiles([_imageFile.path]);
      //   }else{
      //     final _directory = await getApplicationDocumentsDirectory();
      //     final _imageFile = File('${_directory.path}/qr.png');
      //     _imageFile.writeAsBytesSync(_image);
      //     await GallerySaver.saveImage(_imageFile.path,albumName: 'aqcess',).then((value) => showCustomSnackBar('QR code save to your Gallery',isError: false));
      //   }

      // });

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
      _isDetailsv = false;

      ApiChecker.checkApi(response);
    }
    _isDetailsv = false;

    update();
    return response;
  }

  Future<Response> registration(
      PassBody signUpBody, BuildContext context) async {
    _isLoading = true;
    update();
    Map<String, String> _allCustomerInfo = {
      'full_name': signUpBody.fullName,
      'phone': signUpBody.phone,
      'save': signUpBody.save.toString(),
      'reason': signUpBody.reason,
      'user_id': signUpBody.userId,
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
      String idofpass = response.body['transaction_id'].toString();
      // String qrcode = response.body['qr_code'];
      String qrcode = "hello world";

      Get.find<ScreenShootWidgetController>().qrCodeDownloadAndShare(
          qrCode: qrcode, phoneNumber: idofpass, isShare: true);

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

  Future<Response> addContact(String name, String email, String type,
      String phone, BuildContext context) async {
    _isLoading = true;
    update();
    Map<String, String> _allCustomerInfo = {
      'name': name,
      'email': email,
      'phone': phone,
      'type': type,
    };

    Response response = await passRepo.addContact(_allCustomerInfo);
    print('error is');
    if (response.statusCode == 200) {
      await getContactsData(1, reload: true);
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

  Future<Response> updateContact(String name, String email, String type,
      String phone, String id, BuildContext context) async {
    _isLoading = true;
    update();
    Map<String, String> _allCustomerInfo = {
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

  Future<Response> deleteContact(String id, BuildContext context) async {
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
    } else {
      Get.back();
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<Response> checkOtp() async {
    _isLoading = true;
    update();
    Response response = await passRepo.checkOtpApi();
    if (response.statusCode == 200) {
      _isLoading = false;
    } else {
      _isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }

  Future<Response> verifyOtp(String otp) async {
    _isVerifying = true;
    update();
    Response response = await passRepo.verifyOtpApi(otp: otp);
    if (response.statusCode == 200) {
      _isVerifying = false;
      Get.back();
    } else {
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
