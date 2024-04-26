import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:harav_assignment/subScreen/locationAndSearchar.dart';
import 'package:harav_assignment/subScreen/promo.dart';
import 'package:harav_assignment/subScreen/show_coffee_grid.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  var longitude;
  var latitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   color: const Color.fromARGB(255, 33, 243, 89),
          // ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 290,
              color: Color.fromARGB(252, 157, 17, 17),
              child: LocationAndSearchBar(),
            ),
          ),
          Positioned.fill(
            top: 290,
            child: showCoffeeGrid(),
          ),
          Positioned(
              top: 200,
              left: 30,
              right: 30,
              child: Container(
                height: 160,
                child: PromoBanner(),
                // height: promoHeight,
                // color: Color.fromARGB(223, 18, 224, 218).withOpacity(0.5),
              )),
        ],
      ),
    );
  }
}
