import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_mysubmission/presentation/widgets/appbar.dart';
import 'package:flutter_application_mysubmission/presentation/widgets/drawer.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 241, 230),
      appBar: AppAppBar(),
      drawer: AppDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Booked Rooms',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 20),
          
          Card(
            color: Color.fromARGB(255, 244, 229, 212),
            margin: EdgeInsets.symmetric(horizontal: 30),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), 
            ),
            child: Padding(
              
              padding: const EdgeInsets.all(10.0), // Padding inside the card
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,// Align contents to the left
                children: [
                  Image.asset(
                    'lib/images/bgc_hotel.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity, 
                    height: 250, 
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Fancy Bedroom:',
                    style: TextStyle(
                      color: Color.fromARGB(255, 95, 65, 65),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Date - 00/00/00 - 00/00/00',
                    style: TextStyle(
                      color: Color.fromARGB(255, 95, 65, 65),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                         _showDatePickerDialog(context);
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(color: Colors.blue),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 231, 228, 226),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          _showDatePickerDialog;
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Color.fromARGB(255, 243, 33, 33)),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 231, 228, 226),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

 void _showDatePickerDialog(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (selectedDate != null) {
      print('Selected date: $selectedDate');
    }
  }
}