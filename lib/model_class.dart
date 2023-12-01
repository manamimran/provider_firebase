class User {
  late String uid;
  late String? email;

  User({required this.uid, required this.email});

  User.fromMap(Map<String, dynamic> data) {
    uid = data['uId'];
    email = data['Email'];
  }

  Map<String, dynamic> toMap() {
    return {"uId": uid, "Email": email};
  }
}
