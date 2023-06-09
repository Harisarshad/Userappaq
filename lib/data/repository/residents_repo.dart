
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/util/app_constants.dart';

class ResidentsRepo{
  final ApiClient apiClient;

  ResidentsRepo({@required this.apiClient});

  Future<Response> getResidents(int offset,String search) async {
    return await apiClient.getData('${AppConstants.LIST_RESIDENTS_URI}?limit=1000&offset=$offset&search=$search');
  }
  Future<Response> getPending(int offset,String search) async {
    return await apiClient.getData('${AppConstants.LIST_RESIDENTSP_URI}?limit=1000&offset=$offset&search=$search');
  }
  Future<Response> getApprove(String id) async {
    return await apiClient.getData('${AppConstants.UPDATE_RESIDENTS_URI}/approve/$id');
  }
  Future<Response> getReject(String id) async {
    return await apiClient.getData('${AppConstants.UPDATE_RESIDENTS_URI}/reject/$id');
  }

}