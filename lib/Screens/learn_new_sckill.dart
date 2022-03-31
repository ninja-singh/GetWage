import 'package:flutter/material.dart';
import 'package:getwage/Models/skill.model.dart';
import 'package:getwage/components/skillContainer.dart';

class LearnNewSkill extends StatefulWidget {
  const LearnNewSkill({Key? key}) : super(key: key);

  @override
  State<LearnNewSkill> createState() => _LearnNewSkillState();
}

class _LearnNewSkillState extends State<LearnNewSkill> {
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
                  child: const Text("Learn New Skill",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      )),
                ),
                background: Image.asset(
                  "assets/illus1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            itemCount: SkillModel.skills.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return SkillContainer(index: index);
            },
          ),
        ),
      ),
    );
  }
}
