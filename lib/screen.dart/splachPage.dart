import 'package:flutter/material.dart';

import 'package:harav_assignment/screen.dart/homepage.dart';
import 'package:harav_assignment/subScreen/bottomBar.dart';

class SplachPage extends StatefulWidget {
  const SplachPage({super.key});

  @override
  State<SplachPage> createState() => _SplachPageState();
}

class _SplachPageState extends State<SplachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              child: Image(
                image: AssetImage("lib/assets/coffeeImages/coffeeSplach.jpeg"),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "Coffee so good, your taste buds will love it",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "The best grain, the finest roast the powerful flavor.",
                            style: TextStyle(
                                fontSize: 15,
                                color:
                                    const Color.fromARGB(255, 199, 199, 199)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomBar()),
                        );
                        print("I am running");
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffC67C4F),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
