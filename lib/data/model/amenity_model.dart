class AmenityModel {
  int totalSize;
  int limit;
  int offset;
  List<AmenityData> transactions;

  AmenityModel(
      {this.totalSize, this.limit, this.offset, this.transactions});

  AmenityModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['transactions'] != null) {
      transactions = <AmenityData>[];
      json['transactions'].forEach((v) {
        transactions.add(new AmenityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.transactions != null) {
      data['transactions'] = this.transactions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AmenityData {
  String id;

  UserInfo userInfo;
  String name;
  String start;
  String end;
  String image;
  String phone;
  String email;
  String visitType;


  AmenityData(
      {
        this.id,

        this.userInfo,
        this.name,
        this.start,
        this.end,
        this.image,

      });

  AmenityData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();

    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    name = json['name'].toString();
    start = json['start'].toString();
    end = json['start'].toString();
    image = json['image'].toString();



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
    data['name'] = this.name;
    data['start'] = this.start;
    data['end'] = this.end;
    data['image'] = this.image;

    return data;
  }
}

class UserInfo {
  String phone;
  String name;

  UserInfo({this.phone, this.name});

  UserInfo.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['name'] = this.name;
    return data;
  }
}

class Sender {
  String phone;
  String name;

  Sender({this.phone, this.name});

  Sender.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] ?? '';
    name = json['name'] ?? '';
  }
}

class Receiver {
  String phone;
  String name;
  Receiver({this.phone, this.name});

  Receiver.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] ?? '';
    name = json['name'] ?? '';
  }
}