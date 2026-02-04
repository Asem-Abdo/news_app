import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

import 'category_item.dart';

typedef OnCategoryItemClick = void Function(Category category);

class ViewItem extends StatelessWidget {
  ViewItem({super.key, required this.onCategoryItemClick});

  OnCategoryItemClick onCategoryItemClick;
  List<Category> categories = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return CategoryItem(
          onCategoryItemClick: (category) {
            onCategoryItemClick(categories[index]);
          },
          category: categories[index],
          crossAxisAlignment: index % 2 != 0
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          isRight: index % 2 == 0 ? true : false,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16);
      },
      itemCount: categories.length,
    );
  }
}
