import 'package:six_cash/controller/camera_screen_controller.dart';
import 'package:six_cash/controller/profile_screen_controller.dart';
import 'package:six_cash/data/api/api_checker.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/data/model/body/edit_amenty_body.dart';
import 'package:six_cash/data/model/contact_model.dart';
import 'package:six_cash/data/repository/transaction_history_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/util/app_constants.dart';
import 'package:six_cash/view/base/custom_snackbar.dart';

import '../data/model/amenity_model.dart';
import '../data/model/response/response_model.dart';
import '../data/repository/amenities_repo.dart';
import '../data/repository/contacts_repo.dart';

class AmenitiesController extends GetxController implements GetxService{
  final AmenitiesRepo transactionHistoryRepo;
  AmenitiesController({@required this.transactionHistoryRepo});


  bool _isSearching = false;
  int _pageSize;
  bool _isLoading = false;
  bool _firstLoading = true;
  bool get firstLoading => _firstLoading;

  int _pageSizebooking;
  bool _isLoadingbooking = false;
  bool _firstLoadingbooking = true;
  bool get firstLoadingbooking => _firstLoadingbooking;
  int _offset = 1;
  int _offsetbooking = 1;
  int get offset =>_offset;
  int get offsetbooking =>_offsetbooking;

  List<int> _offsetList = [];
  List<int> get offsetList => _offsetList;

  List<AmenityData> _amenityList  = [];
  List<AmenityData> get contactList => _amenityList;
 List<int> _offsetListbooking = [];
  List<int> get offsetListbooking => _offsetListbooking;

  List<AmenityData> _amenityListbooking  = [];
  List<AmenityData> get contactListbooking => _amenityListbooking;





  bool get isSearching => _isSearching;
  int get pageSizebooking => _pageSizebooking;
  bool get isLoading => _isLoading;

  bool get isLoadingbooking => _isLoadingbooking;
  ScrollController scrollController = ScrollController();
  bool isMoreDataAvailable = true;

  
  Future<bool> updateAmentiesData(EditAmenityBody editProfileBody,

      List<MultipartBody> multipartBody) async {
    _isLoading = true;
    bool _emailValidation = true;
    bool _isSuccess = false;
    update();
    Map<String, String> _allProfileInfo = {
      'name': editProfileBody.name,
      'start': editProfileBody.start,
      'end': editProfileBody.end,
      // 'gender': editProfileBody.gender,
      // 'occupation': editProfileBody.occupation,
      '_method': 'put',
    };


      {
      Response response =
      await transactionHistoryRepo.updateAmenties(_allProfileInfo, multipartBody);
      ResponseModel responseModel;
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, response.body['message']);
        _isSuccess = true;
        if (Get.find<CameraScreenController>().getImage != null) {
          Get.find<CameraScreenController>().removeImage();
        }
        Get.find<ProfileController>().profileData(reload: true, isUpdate: true);
        Get.back();
        print(responseModel.message);
        showCustomSnackBar(responseModel.message, isError: false);
      } else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
    return _isSuccess;
  }





  void showBottomLoader() {
    _isLoading = true;
    update();
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

    Response response = await transactionHistoryRepo.updateContact(_allCustomerInfo);
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

    Response response = await transactionHistoryRepo.deleteContact(id);
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

 
  Future getmyAmenities(int offset, {bool reload = false}) async{
    if(reload) {
      _offsetList = [];
      _amenityList = [];

    }
    _offset = offset;
    if(!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      Response response = await transactionHistoryRepo.getmyAmenity(offset);
      if(response.body['transactions'] != null && response.body['transactions'] != {} && response.statusCode==200){
        _amenityList = [];

        response.body['transactions'].forEach((transactionHistory) {
          AmenityData history = AmenityData.fromJson(transactionHistory);
          _amenityList.add(history);
        });
        _pageSize = AmenityModel.fromJson(response.body).totalSize;
      }else{
        ApiChecker.checkApi(response);
      }
    }
    _isLoading = false;
    _firstLoading = false;
    update();
  }

  Future getAmenitiesBooking(int offset, {bool reload = false}) async{
    if(reload) {
      _offsetListbooking = [];
      _amenityListbooking = [];

    }
    _offset = offset;
    if(!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      Response response = await transactionHistoryRepo.getmyAmenity(offset);
      if(response.body['transactions'] != null && response.body['transactions'] != {} && response.statusCode==200){
        _amenityListbooking = [];

        response.body['transactions'].forEach((transactionHistory) {
          AmenityData history = AmenityData.fromJson(transactionHistory);
          _amenityListbooking.add(history);
        });
        _pageSizebooking = AmenityModel.fromJson(response.body).totalSize;
      }else{
        ApiChecker.checkApi(response);
      }
    }
    _isLoadingbooking= false;
    _firstLoadingbooking = false;
    update();
  }

  Future getAmenitiesforMe(int offset, {bool reload = false}) async{
    if(reload) {
      _offsetList = [];
      _amenityList = [];

    }
    _offset = offset;
    if(!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      Response response = await transactionHistoryRepo.getAmenityForME(offset);
      if(response.body['transactions'] != null && response.body['transactions'] != {} && response.statusCode==200){
        _amenityList = [];

        response.body['transactions'].forEach((transactionHistory) {
          AmenityData history = AmenityData.fromJson(transactionHistory);
          _amenityList.add(history);
        });
        _pageSize = AmenityModel.fromJson(response.body).totalSize;
      }else{
        ApiChecker.checkApi(response);
      }
    }
    _isLoading = false;
    _firstLoading = false;
    update();
  }

  Future getAmenitiesBookingforME(int offset, {bool reload = false}) async{
    if(reload) {
      _offsetListbooking = [];
      _amenityListbooking = [];

    }
    _offset = offset;
    if(!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      Response response = await transactionHistoryRepo.getmyAmenity(offset);
      if(response.body['transactions'] != null && response.body['transactions'] != {} && response.statusCode==200){
        _amenityListbooking = [];

        response.body['transactions'].forEach((transactionHistory) {
          AmenityData history = AmenityData.fromJson(transactionHistory);
          _amenityListbooking.add(history);
        });
        _pageSizebooking = AmenityModel.fromJson(response.body).totalSize;
      }else{
        ApiChecker.checkApi(response);
      }
    }
    _isLoadingbooking= false;
    _firstLoadingbooking = false;
    update();
  }



  int _transactionTypeIndex = 0;
  int get transactionTypeIndex => _transactionTypeIndex;

  void setIndex(int index) {
    _transactionTypeIndex = index;
    update();
  }

}