import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotel_booking/presentation/widgets/appbar.dart';
import 'package:hotel_booking/presentation/widgets/datas.dart';
import 'package:hotel_booking/presentation/widgets/drawer.dart';



class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                  category['title'],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 95, 65, 65),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CarouselSlider.builder(
                  itemCount: category['images'].length,
                  options: CarouselOptions(
                    height: 465,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Card(
                      color: const Color.fromARGB(255, 244, 229, 212),
                      elevation: 5.0,
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
                              category['descriptions'][index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(255, 95, 65, 65),
                              ),
                            ),
                            Text(
                              'Price: \$${category['prices'][index]}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 95, 65, 65),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _showEditDialog(context, category, index),
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
                                    setState(() {
                                      category['images'].removeAt(index);
                                      category['descriptions'].removeAt(index);
                                      category['prices'].removeAt(index);
                                    });
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
                    );
                  },
                ),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 252, 241, 230),
        tooltip: 'Add New Room',
        onPressed: () {
          _showAddNewDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

 void _showAddNewDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    String? imagePath; // Variable to hold the selected image path

    showDialog(
        context: context,
        builder: (BuildContext context) {
            return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 252, 241, 230),
                title: const Text('Add New Room Category'),
                content: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            ElevatedButton(
                                onPressed: () async {
                                    // Let the user pick an image file
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                                        type: FileType.image, // Allow only images
                                    );

                                    // If a file was selected, update the imagePath variable
                                    if (result != null) {
                                        PlatformFile file = result.files.first;
                                        setState(() {
                                            imagePath = file.path; // Store the image path in state
                                        });
                                    }
                                },
                                child: const Text('Select Image'),
                            ),

                            // If an image path is set, display the image using Image.file
                            if (imagePath != null)
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.file(
                                        File(imagePath!), // Display the image using Image.file
                                        height: 200, // You can set the height as per your requirements
                                        width: double.infinity, // Fill the width of the dialog
                                        fit: BoxFit.cover, // Choose the fit mode as per your preference
                                    ),
                                    
                                ),

                            // Other input fields for title, description, and price
                            TextField(
                                controller: titleController,
                                decoration: const InputDecoration(labelText: 'Category Title'),
                            ),
                            TextField(
                                controller: descriptionController,
                                decoration: const InputDecoration(labelText: 'Description'),
                            ),
                            TextField(
                                controller: priceController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(labelText: 'Price'),
                            ),
                        ],
                    ),
                ),
                actions: <Widget>[
                    TextButton(
                        onPressed: () {
                            Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                            setState(() {
                                if (categories.any((category) => category['title'] == titleController.text)) {
                                    final category = categories.firstWhere((cat) => cat['title'] == titleController.text);
                                    category['images'].add(imagePath);
                                    category['descriptions'].add(descriptionController.text);
                                    category['prices'].add(int.parse(priceController.text));
                                } else {
                                    categories.add({
                                        'title': titleController.text,
                                        'images': [imagePath],
                                        'descriptions': [descriptionController.text],
                                        'prices': [int.parse(priceController.text)],
                                    });
                                }
                            });
                            Navigator.of(context).pop();
                        },
                        child: const Text('Save'),
                    ),
                ],
            );
        },
    );
}


  void _showEditDialog(BuildContext context, Map<String, dynamic> category, int index) {
    TextEditingController categoryName = TextEditingController(text: category['title']);
    TextEditingController descriptionController = TextEditingController(text: category['descriptions'][index]);
    TextEditingController priceController = TextEditingController(text: category['prices'][index].toString());
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 252, 241, 230),
          title: const Text('Edit Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: categoryName,
                  decoration: const InputDecoration(labelText: 'Category'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Price'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  category['title'] = categoryName.text;
                  category['descriptions'][index] = descriptionController.text;
                  category['prices'][index] = int.parse(priceController.text);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
