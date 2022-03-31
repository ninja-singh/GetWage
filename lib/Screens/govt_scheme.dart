import 'package:flutter/material.dart';
import 'package:getwage/Models/skill.model.dart';
import 'package:getwage/components/skillContainer.dart';

import '../Models/govtScheme.model.dart';
import '../components/governmentSchemeContainer.dart';

class GovernmentScheme extends StatefulWidget {
  const GovernmentScheme({Key? key}) : super(key: key);

  @override
  State<GovernmentScheme> createState() => _GovernmentSchemeState();
}

class _GovernmentSchemeState extends State<GovernmentScheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              iconTheme: IconThemeData(color: Colors.black),
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Text("Government Schemes",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      )),
                ),
                background: Image.asset(
                  "assets/pm.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: GovtSchemeModel.schemes.length,
            itemBuilder: (context, index) {
              return GovernmentSchemeContainer(index: index);
            },
          ),
        ),
      ),
    );
  }
}
