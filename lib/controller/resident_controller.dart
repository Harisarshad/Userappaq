import 'package:six_cash/data/api/api_checker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/util/app_constants.dart';

import '../data/model/resident_model.dart';
import '../data/repository/contacts_repo.dart';
import '../data/repository/residents_repo.dart';

class ResidentsController extends GetxController implements GetxService{
  final ResidentsRepo residentsRepo;
  ResidentsController({@required this.residentsRepo});


  bool _isSearching = false;
  bool _isSearchingPending = false;
  int _pageSize;
  int _pageSizePending;
  bool _isLoading = false;
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

  List<Resident> _contactList  = [];
  List<Resident> _contactListPending  = [];
  List<Resident> get contactList => _contactList;
  List<Resident> get contactListPending => _contactListPending;





  bool get isSearching => _isSearching;
  bool get isSearchingPending => _isSearchingPending;
  int get pageSize => _pageSize;
  int get pageSizePending => _pageSizePending;
  bool get isLoading => _isLoading;
  bool get isLoadingPending => _isLoadingPending;
  ScrollController scrollController = ScrollController();
  bool isMoreDataAvailable = true;

  void showBottomLoader() {
    _isLoading = true;
    update();
  }


  Future getContactsData(int offset, {bool reload = false}) async{
    if(reload) {
      _offsetList = [];
      _contactList = [];

    }
    _offset = offset;
    if(!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      Response response = await residentsRepo.getResidents(offset);
      if(response.body['transactions'] != null && response.body['transactions'] != {} && response.statusCode==200){
        _contactList = [];

        response.body['transactions'].forEach((transactionHistory) {
          Resident history = Resident.fromJson(transactionHistory);
          _contactList.add(history);
        });
        _pageSize = ResidentModel.fromJson(response.body).totalSize;
      }else{
        ApiChecker.checkApi(response);
      }
    }
    _isLoading = false;
    _firstLoading = false;
    update();
  }
  Future getContactsPending(int offset, {bool reload = false}) async{
    if(reload) {
      _offsetListPending = [];
      _contactListPending = [];

    }
    _offset = offset;
    if(!_offsetListPending.contains(offset)) {
      _offsetListPending.add(offset);

      Response response = await residentsRepo.getPending(offset);
      if(response.body['transactions'] != null && response.body['transactions'] != {} && response.statusCode==200){
        _contactListPending = [];

        response.body['transactions'].forEach((transactionHistory) {
          Resident history = Resident.fromJson(transactionHistory);
          _contactListPending.add(history);
        });
        _pageSizePending = ResidentModel.fromJson(response.body).totalSize;
      }else{
        ApiChecker.checkApi(response);
      }
    }
    _isLoadingPending = false;
    _firstLoadingPending = false;
    update();
  }
  int _transactionTypeIndex = 0;
  int get transactionTypeIndex => _transactionTypeIndex;

  void setIndex(int index) {
    _transactionTypeIndex = index;
    update();
  }

}