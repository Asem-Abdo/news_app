import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

import '../../../../model/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.category,
    required this.isRight,
    required this.onTap,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });
  final Category category;
  CrossAxisAlignment crossAxisAlignment;
  bool isRight = true;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(category.image),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(category.title, style: Theme.of(context).textTheme.titleLarge),
            InkWell(
              onTap: onTap,
              child: Container(
                height: height * .055,
                width: width * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(84),
                  color: AppColors.greyColor,
                ),
                child: isRight
                    ? Row(
                        children: [
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'View all'.tr(),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'View all'.tr(),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
