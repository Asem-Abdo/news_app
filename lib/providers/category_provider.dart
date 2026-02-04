import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  Category? category;

  CategoryProvider(this.category);

  void onViewAllClick(Category newCategory) {
    category = newCategory;
    notifyListeners();
  }
}
