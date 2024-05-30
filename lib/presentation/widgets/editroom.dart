import 'package:fffff/presentation/pages/rooms_catagories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void showEditDialog(
      BuildContext context, WidgetRef ref, int categoryIndex, int itemIndex) {
    final category = ref.read(roomCategoriesProvider)[categoryIndex];
    TextEditingController titleController =
        TextEditingController(text: category['title']);
    TextEditingController descriptionController =
        TextEditingController(text: category['descriptions'][itemIndex]);
    TextEditingController priceController =
        TextEditingController(text: category['prices'][itemIndex].toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 252, 241, 230),
          title: const Text('Edit Room Category'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration:
                      const InputDecoration(labelText: 'Category Title'),
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
                ref.read(roomCategoriesProvider.notifier).updateCategory(
                      categoryIndex,
                      itemIndex,
                      titleController.text,
                      descriptionController.text,
                      int.parse(priceController.text),
                    );
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
