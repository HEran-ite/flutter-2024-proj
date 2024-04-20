import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking/presentation/widgets/appbar.dart';
import 'package:hotel_booking/presentation/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 241, 230),
      appBar: AppAppBar(),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.symmetric(horizontal:2),
            width: screenSize.width,
            height: screenSize.height * 0.3,
            child: PageView(
              children: [
                Image.asset('lib/images/entry.jpeg', fit: BoxFit.cover),
                Image.asset('lib/images/entry2.jpeg', fit: BoxFit.cover),
                Image.asset('lib/images/entry3.jpeg', fit: BoxFit.cover),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'WELCOME  TO OAISIS HOTEL!',
            style: TextStyle(
              color: Color.fromARGB(255, 95, 65, 65),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              style: TextStyle(
            
                color: Color.fromARGB(255, 95, 65, 65),
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(onPressed:() {
                 Navigator.pushNamed(context, '/booking_page');
              }, 
              child:Text(
                'B O O K' ,
                style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 93, 64, 50)),
              ),)  
        ],
      ),
    );
  }
}
