import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:provider/provider.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});
  static final ThemeProvider themeProvider = ThemeProvider();

  static List<Category> getCategories() {
    return [
      Category(
        id: 'general',
        title: 'General'.tr(),
        image: themeProvider.theme == ThemeMode.dark
            ? AppAssets.generalDark
            : AppAssets.general,
      ),
      Category(
        id: 'business',
        title: 'Business'.tr(),
        image: themeProvider.theme == ThemeMode.dark
            ? AppAssets.businessDark
            : AppAssets.business,
      ),
      Category(
        id: 'sports',
        title: 'Sports'.tr(),
        image: themeProvider.theme == ThemeMode.dark
            ? AppAssets.sportDark
            : AppAssets.sport,
      ),
      Category(
        id: 'technology',
        title: 'Technology',
        image: themeProvider.theme == ThemeMode.dark
            ? AppAssets.technologyDark
            : AppAssets.technology,
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
        image: themeProvider.theme == ThemeMode.dark
            ? AppAssets.entertainmentDark
            : AppAssets.entertainment,
      ),
      Category(
        id: 'health',
        title: 'Health',
        image: themeProvider.theme == ThemeMode.dark
            ? AppAssets.healthDark
            : AppAssets.health,
      ),
      Category(
        id: 'science',
        title: 'Science',
        image: themeProvider.theme == ThemeMode.dark
            ? AppAssets.scienceDark
            : AppAssets.science,
      ),
    ];
  }
}
