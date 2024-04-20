import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/screens/admin_page.dart';
import 'package:hotel_booking/presentation/screens/home_page.dart';



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

      },
      initialRoute: '/admin_page',
    );
  }
}





