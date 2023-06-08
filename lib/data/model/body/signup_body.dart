
import 'package:flutter/cupertino.dart';

class SignUpBody {
  String fName;
  String lName;
  String email;
  String phone;
  String userType;
  String parentCode;
  String password;
  String otp;
  String gender;
  String occupation;
  String dialCountryCode;

  SignUpBody({
    @required this.fName,
    @required this.lName,
    @required this.phone,
    @required this.parentCode,
    @required this.userType,
    this.email,
    @required this.password,
    this.otp,
    @required this.gender,
    @required this.occupation,
    @required this.dialCountryCode,
  });

  SignUpBody.fromJson(Map<String, dynamic> json) {
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    parentCode = json['parent_code'];
    email = json['email'];
    userType = json['type'];
    password = json['password'];
    otp = json['otp'];
    gender = json['gender'];
    occupation = json['occupation'];
    dialCountryCode = json['dial_country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['parent_code'] = this.parentCode;
    data['type'] = this.userType;
    data['email'] = this.email;
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['gender'] = this.gender;
    data['occupation'] = this.occupation;
    data['dial_country_code'] = this.dialCountryCode;
    return data;
  }
}