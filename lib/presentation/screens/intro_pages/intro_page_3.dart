// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IntroPage3 extends StatelessWidget{
  const IntroPage3({Key?key}): super(key:key);
  
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('lib/images/blur_hotel.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.5), // Adjust the opacity and color as needed
                BlendMode.dstATop,
              ),
        ),
        
       ),
      child: Center(
        child:Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           

            SizedBox(height:20),
            Text(
      'Discover Exclusive Offers',
      style: GoogleFonts.pacifico(
        fontSize: 32,
        fontWeight: FontWeight.w300,
        color: Color.fromARGB(255, 40, 41, 42),
      ),
    ),
    SizedBox(height: 20),
    Text(
      'Unlock member-only deals.',
      style: GoogleFonts.lato(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.grey[700],
      ),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 10),
    Text(
      'Indulge in gourmet dining.',
      style: GoogleFonts.lato(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.grey[700],
      ),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 10),
    Text(
      'Experience excellence with us!',
      style: GoogleFonts.lato(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.grey[700],
      ),
      textAlign: TextAlign.center,
    ),
          ],
          ),)
    );
  }
}