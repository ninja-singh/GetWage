import 'package:flutter/material.dart';

const Color kAccent = Color(0xff0E31E5);
const Color kCard = Color(0xffF3F3F3);
const Color kYellow = Color(0xffF3F3F3);
Widget cirleButton(VoidCallback? onTab, IconData icn, bool isWhite) => Align(
      alignment: Alignment.bottomCenter,
      child: CircleAvatar(
        backgroundColor: isWhite ? Colors.white : kAccent,
        radius: 30,
        child: IconButton(
            onPressed: onTab,
            icon: Icon(icn, color: isWhite ? Colors.black : Colors.white)),
      ),
    );

Widget namaste(BuildContext context) => Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Namaste",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          const Positioned(
            top: 42,
            left: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "A lil bit about yourself",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );

Widget selectableButton(bool isSelected, String title) {
  return Container(
    height: 50,
    width: 300,
    decoration: BoxDecoration(
      color: isSelected ? kAccent : kCard,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
      ),
    ),
  );
}

Widget CheckBoxTile(String titile, bool isSelected) {
  return SizedBox(
    width: 300,
    child: ListTile(
      trailing: isSelected
          ? const CircleAvatar(
              radius: 15,
              backgroundColor: kAccent,
              child: Icon(Icons.check),
            )
          : Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  border: Border.all(color: kAccent, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
      title: Text(titile),
    ),
  );
}
