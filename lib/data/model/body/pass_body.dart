
import 'package:flutter/cupertino.dart';

class PassBody {

  String fullName;
  String save;
  String phone;
  String reason;
  String permanent;
  String date;
  String startDate;
  String endDate;

  PassBody({
    @required this.fullName,
    @required this.phone,
    this.save,
    @required this.reason,
    this.permanent,
    @required this.date,
    @required this.startDate,
    @required this.endDate,
  });

  PassBody.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    phone = json['phone'];
    save = json['save'];
    reason = json['reason'];
    permanent = json['permanent'];
    date = json['date'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;

    data['phone'] = this.phone;
    data['save'] = this.save;
    data['reason'] = this.reason;
    data['permanent'] = this.permanent;
    data['date'] = this.date;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;

    return data;
  }
}