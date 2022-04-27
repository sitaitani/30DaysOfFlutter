class UserData {
  String name = "";
  String uid = "";

  UserData(String name, String uid) {
    this.name = name;
    this.uid = uid;
  }

  UserData.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'] as String;
    uid = json["uid"];
  }
}

UserData userInformation = UserData("", "");
