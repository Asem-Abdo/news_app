import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home_screen/widget/view_item.dart';

import '../../../../model/category.dart';

typedef OnCategoryItemClick = void Function(Category category);

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key, required this.onCategoryItemClick});
  OnCategoryItemClick onCategoryItemClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning'.tr(),

            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Here is Some News For You'.tr(),

            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 15),
          Expanded(child: ViewItem(onCategoryItemClick: onCategoryItemClick)),
        ],
      ),
    );
  }
}
