import 'package:flutter/material.dart';
import 'package:getwage/Models/user.model.dart';
import 'package:getwage/Service/add_to_firebase.dart';
import 'package:getwage/credentials/supabase.credential.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  static Future sendVerifivationCode(
      {required String phoneNumber, required BuildContext context}) async {
    try {
      GotrueSessionResponse response =
          await SupabaseCredentials.supabaseClient.auth.signIn(
              phone: phoneNumber,
              options: AuthOptions(redirectTo: SupabaseCredentials.APIURL));
      if (response.error == null) {
        print("inside if block");
        print(response.url);
      } else {
        print(response.error);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('login failed')));
      }
    } catch (e) {
      print(e);
    }
  }

  static Future verifyphoneNumber(
      {required String tokenNumber,
      required UserModel usr,
      required String phoneNumber,
      required BuildContext context}) async {
    var box = await Hive.openBox('userDetails');
    try {
      GotrueSessionResponse response = await SupabaseCredentials
          .supabaseClient.auth
          .verifyOTP(phoneNumber, tokenNumber);
      if (response.error == null) {
        FirebaseDatabase.addUserDB(usr);
        box.put('userId', usr.userId);
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("There's something wrong,please try again"),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  static Future loginphoneNumber(
      {required String tokenNumber,
      required String phoneNumber,
      required BuildContext context}) async {
    var box = await Hive.openBox('userDetails');

    GotrueSessionResponse response = await SupabaseCredentials
        .supabaseClient.auth
        .verifyOTP(phoneNumber, tokenNumber);
    if (response.error == null) {
      print(response.data);
      box.put('userId', FirebaseDatabase.kUser!.userId);
      Navigator.pushNamed(context, '/home');
    } else {
      print(response.error);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("There's something wrong,please try again"),
        ),
      );
    }
  }
}
