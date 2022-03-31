import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getwage/NewUser/info_screen_one.dart';
import 'package:getwage/NewUser/info_screen_two.dart';
import 'package:getwage/NewUser/splash_screen.dart';
import 'package:getwage/Screens/home_screen.dart';
import 'package:getwage/Service/add_to_firebase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userDetails');
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MmyAppState();
}

class MmyAppState extends State<MyApp> {
  bool isExist = false;
  var box = Hive.box("userDetails");

  @override
  void initState() {
    var uid = box.get("userId");
    // TODO: implement initState
    super.initState();
    FirebaseDatabase.isValidUser(uid).then((value) => setState(() {
          isExist = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("userDetails");
    var uid = box.get("userId");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => isExist ? const HomeScreen() : const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/infoone': (context) => const InfoScreenOne(),
        '/infotwo': (context) => InfoScreenTwo()
      },
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
    );
  }
}
