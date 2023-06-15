import 'package:six_cash/data/api/api_checker.dart';
import 'package:six_cash/data/model/contact_model.dart';
import 'package:six_cash/data/repository/transaction_history_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/util/app_constants.dart';

import '../data/repository/contacts_repo.dart';

class ContactsController extends GetxController implements GetxService{
  final ContactsRepo transactionHistoryRepo;
  ContactsController({@required this.transactionHistoryRepo});


  bool _isSearching = false;
  int _pageSize;
  bool _isLoading = false;
  bool _firstLoading = true;
  bool get firstLoading => _firstLoading;
  int _offset = 1;
  int get offset =>_offset;

  List<int> _offsetList = [];
  List<int> get offsetList => _offsetList;

  List<ContactsData> _contactList  = [];
  List<ContactsData> get contactList => _contactList;





  bool get isSearching => _isSearching;
  int get pageSize => _pageSize;
  bool get isLoading => _isLoading;
  ScrollController scrollController = ScrollController();
  bool isMoreDataAvailable = true;

  void showBottomLoader() {
    _isLoading = true;
    update();
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

    Response response = await transactionHistoryRepo.addContact(_allCustomerInfo);
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

 
  Future getContactsData(int offset, {bool reload = false}) async{
    if(reload) {
      _offsetList = [];
      _contactList = [];

    }
    _offset = offset;
    if(!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      Response response = await transactionHistoryRepo.getContact(offset);
      if(response.body['transactions'] != null && response.body['transactions'] != {} && response.statusCode==200){
        _contactList = [];

        response.body['transactions'].forEach((transactionHistory) {
          ContactsData history = ContactsData.fromJson(transactionHistory);
          _contactList.add(history);
        });
        _pageSize = ContactModel.fromJson(response.body).totalSize;
      }else{
        ApiChecker.checkApi(response);
      }
    }
    _isLoading = false;
    _firstLoading = false;
    update();
  }
  int _transactionTypeIndex = 0;
  int get transactionTypeIndex => _transactionTypeIndex;

  void setIndex(int index) {
    _transactionTypeIndex = index;
    update();
  }

}