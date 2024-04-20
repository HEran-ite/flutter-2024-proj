import 'package:flutter/material.dart';
import "../widgets/textfeild.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<bool> _isSelected = [true,false];
  @override
  Widget build(BuildContext context) {
    // Determine screen size
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 241, 230),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the column
          children: <Widget>[
            Container(
              width: screenSize.width, // Use screen width
              height: screenSize.height * 0.325,
              decoration: const BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage('lib/images/bgc_hotel.jpeg'),
                  fit: BoxFit.cover, // Cover the container with the image
                ),
                borderRadius: BorderRadius.only( // Make bottom border curvy
                  bottomRight: Radius.circular(400),
                ),
              ),
            ),
            const SizedBox(height: 10), // Proper spacing
            // Title/Login Text
            const Text(
              'Sign Up',
              style: TextStyle(
                color: Color.fromARGB(255, 95, 65, 65),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            Center(
              child: ToggleButtons(
                isSelected: _isSelected,
                onPressed: (int index) {
                  setState(() {
                    // Toggle the state of the selected button
                    for (int buttonIndex = 0; buttonIndex < _isSelected.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        _isSelected[buttonIndex] = true;
                      } else {
                        _isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                children: const <Widget>[
                  Padding(
                    padding:EdgeInsets.all(10.0),
                    child: Text('ADMIN'), // Text for the first toggle button
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('User'), // Text for the second toggle button
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20,),
            TextFieldWidget(hintText: "Full Name",obscure:false),
            const SizedBox(height: 20),
            TextFieldWidget(hintText: "Email",obscure :false),
            const SizedBox(height: 20),
            TextFieldWidget(hintText: "Password", obscure:true),
            const SizedBox(height: 20),
            TextFieldWidget(hintText: "Confirm Pssword" , obscure :true),
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[ const Text(
                'Already have an account?',
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 65, 65),
                  fontSize: 14,
                  fontWeight: FontWeight.w200,

                ),
              ),

              GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login_page');
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 65, 65),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
              ]
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed:() {
              if (_isSelected[0])
                 {Navigator.pushNamed(context, '/admin_page');}
              else{
                Navigator.pushNamed(context, '/booking_page');
              }
        
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 93, 64, 50)),
              ), 
              child: const Text(
                'SIGN UP' ,
                style: TextStyle(color: Colors.white),),) 

          ],
        ),
      ),
    );
  }
}
