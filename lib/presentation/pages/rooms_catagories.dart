import 'package:flutter_riverpod/flutter_riverpod.dart';

final roomCategoriesProvider = StateNotifierProvider<RoomCategoriesNotifier, List<Map<String, dynamic>>>((ref) {
  return RoomCategoriesNotifier();
});

class RoomCategoriesNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  RoomCategoriesNotifier() : super([]);

  void addCategory(String title, String base64Image, String description, int price) {
    final category = state.firstWhere((element) => element['title'] == title, orElse: () => {});
    if (category.isNotEmpty) {
      category['descriptions'].add(description);
      category['prices'].add(price);
      category['images'].add(base64Image);
      state = [...state];
    } else {
      state = [...state, {
        'title': title,
        'images': [base64Image],
        'descriptions': [description],
        'prices': [price],
      }];
    }
  }

  void updateCategory(int categoryIndex, int itemIndex, String title, String description, int price) {
    var category = state[categoryIndex];
    category['title'] = title;
    category['descriptions'][itemIndex] = description;
    category['prices'][itemIndex] = price;
    state = [...state];
  }

  void deleteCategory(int categoryIndex, int itemIndex) {
    var category = state[categoryIndex];
    category['descriptions'].removeAt(itemIndex);
    category['prices'].removeAt(itemIndex);
    category['images'].removeAt(itemIndex);
    if (category['descriptions'].isEmpty) {
      state.removeAt(categoryIndex);
    } else {
      state = [...state];
    }
  }
}
