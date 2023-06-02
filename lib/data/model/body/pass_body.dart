
import 'package:flutter/cupertino.dart';

class PassBody {

  String lName;
  String save;
  String phone;
  String reason;
  String permanent;
  String date;
  String startDate;
  String endDate;

  PassBody({
    @required this.lName,
    @required this.phone,
    this.save,
    @required this.reason,
    this.permanent,
    @required this.date,
    @required this.startDate,
    @required this.endDate,
  });

  PassBody.fromJson(Map<String, dynamic> json) {
    lName = json['l_name'];
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
    data['f_name'] = this.lName;

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