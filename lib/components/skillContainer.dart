import 'package:flutter/material.dart';
import 'package:getwage/Models/skill.model.dart';
import 'package:getwage/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillContainer extends StatelessWidget {
  int index;
  SkillContainer({required this.index});

  @override
  Widget build(BuildContext context) {
    void _launchURL(_url) async {
      if (!await launch(_url)) throw 'Could not launch $_url';
    }

    return GestureDetector(
      onTap: () {
        _launchURL(SkillModel.skills[index].onTabUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              SkillModel.skills[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Container(
              height: 130,
              width: Size.infinite.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.network(
                  SkillModel.skills[index].imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
