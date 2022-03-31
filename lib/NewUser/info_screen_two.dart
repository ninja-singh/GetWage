import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwage/Models/user.model.dart';
import 'package:getwage/Screens/home_screen.dart';
import 'package:getwage/Service/fetch_location.dart';
import 'package:getwage/Service/phone_auth.dart';
import 'package:getwage/constants.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class InfoScreenTwo extends StatefulWidget {
  String? usertype;
  List<String>? userCategories;
  InfoScreenTwo({@required this.usertype, @required this.userCategories});
  @override
  State<InfoScreenTwo> createState() => _InfoScreenTwoState();
}

class _InfoScreenTwoState extends State<InfoScreenTwo> {
  TextEditingController pincode = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? state;
  String? city;
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            namaste(context),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Enter Your name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: 200,
                child: Center(
                  child: TextField(
                    controller: pincode,
                    onEditingComplete: () {
                      FetchLocation.getLocation(pincode.text).then((value) {
                        dynamic data = jsonDecode(value.body);
                        if (data[0]["PostOffice"] != null) {
                          setState(() {
                            state = data[0]["PostOffice"][0]["State"];
                            city = data[0]["PostOffice"][0]["District"];
                            stateController.text = state.toString();
                            cityController.text = city.toString();
                          });
                        } else {
                          const snackBar = SnackBar(
                              content: Text('Please enter correct pincode'));
                          _scaffoldKey.currentState!.showSnackBar(snackBar);
                        }
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Pincode",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: TextField(
                    controller: stateController,
                    enabled: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "State",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: TextField(
                    controller: cityController,
                    enabled: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "City",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            cirleButton(() {
              nameController.text.isEmpty ||
                      pincode.text.isEmpty ||
                      stateController.text.isEmpty ||
                      cityController.text.isEmpty
                  ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Enter all the required data"),
                    ))
                  : showModalBottomSheet(
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                    child: TextField(
                                      controller: mobileController,
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
                                onTap: () {
                                  SupabaseAuthService.sendVerifivationCode(
                                      phoneNumber: "+919075125922",
                                      context: context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: kAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                      child: Text(
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
                              cirleButton(() {
                                UserModel newUser = UserModel(
                                    userId: mobileController.text,
                                    userName: nameController.text,
                                    userType: widget.usertype,
                                    userCategories: widget.userCategories,
                                    state: state,
                                    city: city);
                                SupabaseAuthService.verifyphoneNumber(
                                    usr: newUser,
                                    tokenNumber: otpCode!,
                                    phoneNumber: "+91${mobileController.text}",
                                    context: context);
                              }, Icons.arrow_forward_ios, false),
                              const SizedBox(height: 40),
                            ],
                          ),
                        );
                      });
            }, Icons.expand_less, false),
          ],
        ),
      ),
    );
  }
}
