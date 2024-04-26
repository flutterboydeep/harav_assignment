import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harav_assignment/screen.dart/splachPage.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp();
    // await Firebase.initializeApp(
    //   options: FirebaseOptions();
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 33, 23, 20)),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 30,
              fontFamily: 'noto',
              fontWeight: FontWeight.bold,
              color: Colors.white),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'noto',
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontFamily: 'noto',
          ),
          titleSmall: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 196, 194, 194),
            fontFamily: 'noto',
          ),
        ),
        useMaterial3: true,
      ),
      home: SplachPage(),
    );
  }
}
