import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harav_assignment/screen.dart/splachPage.dart';
import 'package:harav_assignment/subScreen/locationAndSearchar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  logOut();
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }

  logOut() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool('authGoogle', false);
    pref.setString('address', "");
    await GoogleSignIn().signOut();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Logout Successfully")));
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplachPage()));
  }
}
