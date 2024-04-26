import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationAndSearchBar extends StatefulWidget {
  const LocationAndSearchBar({super.key});

  @override
  State<LocationAndSearchBar> createState() => _LocationAndSearchBarState();
}

class _LocationAndSearchBarState extends State<LocationAndSearchBar> {
  User? user;
  String location = " ";
  bool isSign = false;
  var latitude = 0.0;
  var longitude = 0.0;
  var locationAddress = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0, 1],
          colors: [
            const Color(0xFF313131),
            const Color(0xFF313131),
            const Color(0xFF131313),
          ],
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Location",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              location,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(15), left: Radius.circular(15)),
                // borderRadius: BorderRadius.circular(17),
                child: InkWell(
                  onTap: () {
                    checkIfSignedIn();
                  },
                  child: isSign != true
                      ? Image(
                          image:
                              // ? AssetImage("lib/assets/coffeeImages/NoPerson.jpgg")
                              AssetImage(
                                  "lib/assets/coffeeImages/coffeeSplach.jpeg"))
                      : Image(image: NetworkImage(user!.photoURL ?? " ")),
                ),
              ),
            ),
          ),
          // Text("User location"),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                hintText: "Search coffee...",
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 222, 222, 222), fontSize: 15),
                fillColor: Color.fromARGB(255, 26, 26, 26),
                filled: true,
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ),
                // suffixIcon: Icon(Icons.format_list_bulleted_rounded)

                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 4.0,
                    bottom: 4.0,
                    right: 8.0,
                  ),
                  child: Container(
                    // height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 244, 158, 54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "lib/assets/coffeeImages/fillter.svg",
                        // bundle: Color(0xff0133122),
                        // allowDrawingOutsideViewBox: true,

                        colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 255, 255, 255),
                          BlendMode.srcIn,
                        ),
                        height: 30,
                        width: 30,

                        // color: Colors.green,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkIfSignedIn() async {
    user = FirebaseAuth.instance.currentUser;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isSign = pref.getBool('authGoogle')!;
      location = pref.getString('address')!;
    });

    if (isSign == null) {
      await getLocationData();
      await googleSignin();
      setState(() {});
      // user = FirebaseAuth.instance.currentUser;
    }
  }

  getLocationData() async {
    // final state = WeatherBloc(WeatherRepo()).state;
    LocationPermission permisson = await Geolocator.checkPermission();
    permisson = await Geolocator.requestPermission();
    if (permisson == LocationPermission.denied ||
        permisson == LocationPermission.deniedForever) {
      permisson = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        latitude = currentPosition.latitude;
        longitude = currentPosition.longitude;
      });
      getAddress(longitude, latitude);
    }
  }

  getAddress(longitude, latitude) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    setState(() {
      locationAddress = placemark[0].locality.toString();
      prefs.setString("address", locationAddress);
      log("This is Location according address $placemark");
    });
  }

  googleSignin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var userCreated =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("authGoogle", true);
      return userCreated;
    } catch (e) {
      throw e.toString();
    }

    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
  }
}
