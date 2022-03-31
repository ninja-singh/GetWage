import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwage/Models/user.model.dart';

class FirebaseDatabase {
  static UserModel? kUser;
  static void addUserDB(UserModel usr) {
    kUser = usr;
    FirebaseFirestore init = FirebaseFirestore.instance;
    init.collection('users').doc(usr.userId).set(usr.toJson());
  }

  static Future<bool> isValidUser(String? userId) async {
    bool exist = false;
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get()
          .then((doc) {
        exist = doc.exists;
        if (exist) {
          kUser = UserModel.fromJson(doc.data()!);
        } else {}
      });
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }
}
