class PassModel {
  int totalSize;
  int limit;
  int offset;
  List<Pass> transactions;

  PassModel(
      {this.totalSize, this.limit, this.offset, this.transactions});

  PassModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['transactions'] != null) {
      transactions = <Pass>[];
      json['transactions'].forEach((v) {
        transactions.add(new Pass.fromJson(v));
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

class Pass {
  String id;
  String resId;
  String reason;
  String fullName;
  String residence;
  String address;
  String save;
  String permanent;
  String date;
  String startDate;
  String endDate;
  String qrCode;
  String image;

  UserInfo userInfo;



  Pass(
      {
        this.id,
        this.resId,
        this.reason,
        this.fullName,
        this.residence,
        this.address,
        this.save,
        this.permanent,
        this.date,
        this.startDate,
        this.endDate,
        this.qrCode,
        this.image,

        this.userInfo,

      });

  Pass.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    resId = json['res_id'].toString();
    reason = json['reason'].toString();
    fullName = json['full_name'].toString();
    residence = json['residence_name'].toString();
    address = json['address'].toString();
    save = json['save'].toString();
    permanent = json['permanent'].toString();
    date = json['date'].toString();
    startDate = json['start_date'].toString();
    endDate = json['end_date'].toString();
    qrCode = json['qr_code'].toString();
    image = json['image'].toString();


    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['res_id'] = this.resId;
    data['reason'] = this.reason;
    data['full_name'] = this.fullName;
    data['address'] = this.address;
    data['residence_name'] = this.residence;
    data['save'] = this.save;
    data['permanent'] = this.permanent;
    data['date'] = this.date;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['image'] = this.image;
    data['qr_code'] = this.qrCode;


    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }


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