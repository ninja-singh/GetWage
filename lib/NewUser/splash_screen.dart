import 'package:flutter/material.dart';
import 'package:getwage/NewUser/info_screen_one.dart';
import 'package:getwage/Screens/home_screen.dart';
import 'package:getwage/Service/add_to_firebase.dart';
import 'package:getwage/Service/phone_auth.dart';
import 'package:getwage/constants.dart';
import 'package:getwage/credentials/supabase.credential.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController newMobileController = TextEditingController();
  String? otpCode;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccent,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: Image.asset("assets/getLogo.png")),
      ),
      bottomNavigationBar: SizedBox(
        height: 200,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(height: 50),
                            Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                color: kCard,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: TextField(
                                    controller: newMobileController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: "Phone number",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                dynamic isValid =
                                    await FirebaseDatabase.isValidUser(
                                        newMobileController.text);

                                isValid
                                    ? SupabaseAuthService.sendVerifivationCode(
                                        phoneNumber:
                                            "+91${newMobileController.text}",
                                        context: context)
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content: Text("No existing user found"),
                                      ));
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: kAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : const Text(
                                            "Send OTP",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: OTPTextField(
                                length: 6,
                                width: MediaQuery.of(context).size.width,
                                style: const TextStyle(fontSize: 17),
                                fieldStyle: FieldStyle.underline,
                                onCompleted: (String value) {
                                  setState(() {
                                    otpCode = value;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 50),
                            isLoading
                                ? Center(child: CircularProgressIndicator())
                                : cirleButton(() {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    print("mobile" + newMobileController.text);
                                    print("otpCode" + otpCode.toString());
                                    SupabaseAuthService.loginphoneNumber(
                                        tokenNumber: otpCode!,
                                        phoneNumber:
                                            "+91${newMobileController.text}",
                                        context: context);
                                  }, Icons.arrow_forward_ios, false),
                            const SizedBox(height: 40),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InfoScreenOne()),
                );
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                    child: Text(
                  "Sign up",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
