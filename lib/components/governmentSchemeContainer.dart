import 'package:flutter/material.dart';
import 'package:getwage/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/govtScheme.model.dart';

class GovernmentSchemeContainer extends StatelessWidget {
  int index;
  GovernmentSchemeContainer({required this.index});

  @override
  Widget build(BuildContext context) {
    void _launchURL(_url) async {
      if (!await launch(_url)) throw 'Could not launch $_url';
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            GovtSchemeModel.schemes[index].title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            GovtSchemeModel.schemes[index].desc,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  _launchURL(GovtSchemeModel.schemes[index].url);
                },
                child: Container(
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: kAccent, borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "Apply",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
