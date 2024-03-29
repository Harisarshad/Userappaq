import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:six_cash/data/api/api_client.dart';
import 'package:six_cash/util/app_constants.dart';

class ContactsRepo {
  final ApiClient apiClient;

  ContactsRepo({@required this.apiClient});

  Future<Response> getContact(int offset) async {
    return await apiClient
        .getData('${AppConstants.LIST_CONTACT_URI}?limit=1000&offset=$offset');
  }

  Future<Response> addContact(
    Map<String, String> customerInfo,
  ) async {
    return await apiClient.postData(AppConstants.ADD_CONTACT_URI, customerInfo);
  }

  Future<Response> deleteContact(
    String id,
  ) async {
    return await apiClient.getData('${AppConstants.DELETE_CONTACT_URI}/$id');
  }

  Future<Response> updateContact(
    Map<String, String> customerInfo,
  ) async {
    return await apiClient.postData(
        AppConstants.UPDATE_CONTACT_URI, customerInfo);
  }
}
