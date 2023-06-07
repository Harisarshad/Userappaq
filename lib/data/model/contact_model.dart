class ContactModel {
  int totalSize;
  int limit;
  int offset;
  List<ContactsData> transactions;

  ContactModel(
      {this.totalSize, this.limit, this.offset, this.transactions});

  ContactModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['transactions'] != null) {
      transactions = <ContactsData>[];
      json['transactions'].forEach((v) {
        transactions.add(new ContactsData.fromJson(v));
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

class ContactsData {
  String id;

  UserInfo userInfo;
  String userName;
  String phone;
  String email;
  String visitType;


  ContactsData(
      {
        this.id,

        this.userInfo,
        this.userName,
        this.phone,
        this.email,
        this.visitType,
      });

  ContactsData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();

    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    userName = json['user_name'].toString();
    phone = json['phone'].toString();
    email = json['email'].toString();
    visitType = json['visit_type'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['visit_type'] = this.visitType;

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