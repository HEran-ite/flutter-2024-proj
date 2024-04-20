import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/screens/admin_page.dart';
import 'package:hotel_booking/presentation/screens/home_page.dart';
import 'package:hotel_booking/presentation/screens/login_page.dart';
import 'package:hotel_booking/presentation/screens/onboarding_screen.dart';
import 'package:hotel_booking/presentation/screens/signup_page.dart';
import 'package:hotel_booking/presentation/screens/status_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
    

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home_page': (context) => HomePage(),
        '/admin_page': (context) => AdminPage(),
        '/status_page': (context) => StatusPage(),
        '/intro_page': (context) => onBoardingScreen(),
        '/signup_page': (context) => SignUpPage(),
        '/login_page':  (context) => LoginPage(),
        

      },
      initialRoute: '/intro_page',
    );
  }
}





