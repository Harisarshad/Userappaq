import 'package:flutter/cupertino.dart';

class EditAmenityBody {
  String name;
  String start;
  String end;


  EditAmenityBody({@required this.name,@required this.start, this.end=''});

  EditAmenityBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    start = json['start'];
    end = json['end'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['start'] = this.start;
    data['end'] = this.end;

    return data;
  }
}