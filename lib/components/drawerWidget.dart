import 'package:flutter/material.dart';
import 'package:getwage/NewUser/splash_screen.dart';
import 'package:getwage/Service/add_to_firebase.dart';
import 'package:getwage/constants.dart';
import 'package:hive/hive.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: kAccent,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 28,
            child: Icon(Icons.person, color: kAccent, size: 40),
          ),
          SizedBox(height: 10),
          Text(
            FirebaseDatabase.kUser!.userName.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 30),
          const ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            trailing: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),
          const ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            trailing: Icon(Icons.chat),
            title: Text("Chat"),
          ),
          const ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            trailing: Icon(Icons.emoji_events),
            title: Text("My Certificates"),
          ),
          const ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            trailing: Icon(Icons.description),
            title: Text("Applied Schemes"),
          ),
          const ListTile(
            iconColor: Colors.white,
            textColor: Colors.white,
            trailing: Icon(Icons.folder_special),
            title: Text("Saved Documents"),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              var box = Hive.box("userDetails");
              box.delete("userId");
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => SplashScreen())),
              );
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
