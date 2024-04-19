import 'package:flutter/material.dart';
import 'package:flutter_application_mysubmission/presentation/screens/onboarding_screen.dart';
import 'package:flutter_application_mysubmission/presentation/screens/status_page.dart';



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
        
        '/status_page': (context) => StatusPage(),
        '/intro_page': (context) => onBoardingScreen()
      },
      
      initialRoute: '/intro_page',
    );
  }
}





