import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/screens/login_page.dart';
import 'package:hotel_booking/presentation/screens/signup_page.dart';


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
        '/signup_page': (context) => SignUpPage(),
        '/login_page': (context) => LoginPage(),
      
      },
      
      initialRoute: '/signup_page',
    );
  }
}





