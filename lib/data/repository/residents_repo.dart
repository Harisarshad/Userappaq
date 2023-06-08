
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/util/app_constants.dart';

class ResidentsRepo{
  final ApiClient apiClient;

  ResidentsRepo({@required this.apiClient});

  Future<Response> getResidents(int offset) async {
    return await apiClient.getData('${AppConstants.LIST_RESIDENTS_URI}?limit=1000&offset=$offset');
  }
  Future<Response> getPending(int offset) async {
    return await apiClient.getData('${AppConstants.LIST_RESIDENTSP_URI}?limit=1000&offset=$offset');
  }
}