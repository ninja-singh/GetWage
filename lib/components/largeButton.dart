import 'package:flutter/material.dart';
import 'package:getwage/constants.dart';

class largeButton extends StatelessWidget {
  String title;
  String subTitle;
  Function onPressed;
  bool isOutlined;
  largeButton({
    required this.title,
    required this.subTitle,
    required this.onPressed,
    required this.isOutlined,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isOutlined ? Colors.white : kAccent,
        border: Border.all(width: 3, color: kAccent),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: isOutlined ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 10,
                  color: isOutlined ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios_sharp,
              color: isOutlined ? Colors.black : Colors.white)
        ],
      ),
    );
  }
}
