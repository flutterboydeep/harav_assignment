import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:harav_assignment/screen.dart/homepage.dart';
import 'package:harav_assignment/screen.dart/userAccount.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIdx = 0;
  List<Widget> pageOption = [
    Homepage(),
    Text(
      "I am ❤ like store",
      style: TextStyle(color: Colors.black, fontSize: 25),
    ),
    Text("I am 👜 Shoping store"),
    UserAccount(),
  ];
  void onTap(int index) {
    setState(() {
      selectedIdx = index;
    });
  }

  Widget bottomDot(idx) {
    return AnimatedContainer(
      duration: Duration(microseconds: 400),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 5,
      width: selectedIdx == idx ? 10 : 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageOption.elementAt(selectedIdx),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 231, 230, 230),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ["home", "heart", "bag", "account"]
              .asMap()
              .map((key, value) => MapEntry(
                  key,
                  InkWell(
                    onTap: () {
                      onTap(key);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "lib/assets/coffeeImages/$value.svg",
                          height: 30,
                          width: 30,
                          colorFilter: ColorFilter.mode(
                              selectedIdx == key ? Colors.orange : Colors.grey,
                              BlendMode.srcIn),
                        ),
                        bottomDot(key),
                      ],
                    ),
                  )))
              .values
              .toList(),
        ),
      ),
    );
  }
}
