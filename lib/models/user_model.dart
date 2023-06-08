
class User {
  String? name;
  String? phone;
  String? password;
  String ?id;
  String? userDeviceToken;
  String? profilePic;
  String? email;

  User({this.name, this.phone, this.password,  this.userDeviceToken,this.id,this.email, this.profilePic});

  User.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
    userDeviceToken = json['device_token'];
    profilePic = json['profilePic'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['profilePic'] = this.profilePic;
    data['id'] = this.id;
    data['email'] = this.email;
    data['device_token'] = this.userDeviceToken;

    return data;
  }
}
