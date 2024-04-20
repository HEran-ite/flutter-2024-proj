import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/widgets/appbar.dart';
import 'package:hotel_booking/presentation/test_input/datas.dart';
import 'package:hotel_booking/presentation/widgets/drawer.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 241, 230),
      appBar: AppAppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: categories.map((category) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  ' ${category['title']} ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 95, 65, 65),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 465,
                  child: PageView.builder(
                    itemCount: category['images'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCard(context, category, index);
                    },
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> category, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 40),
      color: Color.fromARGB(255, 244, 229, 212),
      elevation: 5.0, // Elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              category['images'][index],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Divider(color: Color.fromARGB(255, 208, 188, 188)),
            Text(
              ' ${category['descriptions'][index]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 95, 65, 65)),
            ),
            Text(
              'Price: \$${category['prices'][index]}',
              style: TextStyle(
                color: Color.fromARGB(255, 95, 65, 65),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showDatePickerDialog(context);
              },
              child: Text(
                'B O O K',
                style: TextStyle(color: Color.fromARGB(255, 99, 76, 76)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 235, 231, 229)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show date picker dialog
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
