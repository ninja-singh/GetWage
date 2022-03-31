// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwage/Models/job_model.dart';
import 'package:getwage/Screens/govt_scheme.dart';
import 'package:getwage/Screens/learn_new_sckill.dart';
import 'package:getwage/Service/add_to_firebase.dart';
import 'package:getwage/components/drawerWidget.dart';
import 'package:getwage/components/jobContainer.dart';
import 'package:getwage/components/largeButton.dart';
import 'package:getwage/constants.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        body: SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: 350,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: CircleAvatar(
                              backgroundColor: kAccent,
                              child: Center(
                                child: Text(
                                  FirebaseDatabase.kUser!.userName
                                      .toString()
                                      .toUpperCase()[0],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                              radius: 20,
                            ),
                          );
                        }),
                        const Spacer(),
                        const Text(
                          "Find Jobs",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 22),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LearnNewSkill()));
                    },
                    child: largeButton(
                        title: "Learn New Skill",
                        subTitle: "Increase your chance to get job faster",
                        onPressed: () {},
                        isOutlined: false),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GovernmentScheme())),
                    child: largeButton(
                        title: "Government Scheme",
                        subTitle: "Schemes which can benefit you",
                        onPressed: () {},
                        isOutlined: true),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 350,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kCard,
                            ),
                            child: const Text("Category"),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kCard,
                            ),
                            child: Text("Wage Range"),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kCard,
                            ),
                            child: Text("Location Radius"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: JobModel.jobs.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: JobContainer(
                              index: index,
                              title: JobModel.jobs[index].title,
                              description: JobModel.jobs[index].description,
                              wageRange: JobModel.jobs[index].wage,
                            ),
                          );
                        })),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
