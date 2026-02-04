import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/language_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/ui/home/drawer/widget/divider_item.dart';
import 'package:news_app/ui/home/drawer/widget/drawer_item.dart';
import 'package:news_app/ui/home/drawer/widget/drop_down_bottom_item.dart';
import 'package:news_app/ui/home/home_screen/home_screen.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: AppColors.blackColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: height * .20,
            color: AppColors.whiteColor,
            child: Text('News App'.tr(), style: AppStyles.bold24Black),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
            child: DrawerItem(
              text: 'Go To Home'.tr(),
              icon: AppAssets.home_icon,
            ),
          ),
          SizedBox(height: 24),
          DividerItem(),
          SizedBox(height: 24),
          DrawerItem(text: 'Them'.tr(), icon: AppAssets.theme_icon),
          SizedBox(height: 24),
          DropdownBottomItem<ThemeMode>(
            value: themeProvider.theme,
            items: [
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark'.tr(), style: AppStyles.medium20White),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text('Light'.tr(), style: AppStyles.medium20White),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                themeProvider.changeTheme(value);
              }
            },
            hint: 'Theme'.tr(),
          ),
          SizedBox(height: 24),
          DividerItem(),
          SizedBox(height: 24),
          DrawerItem(text: 'Language'.tr(), icon: AppAssets.language_icon),
          SizedBox(height: 24),
          DropdownBottomItem(
            value: languageProvider.language,
            items: [
              DropdownMenuItem(
                value: 'en',
                child: Text('English'.tr(), style: AppStyles.medium20White),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text('Arabic'.tr(), style: AppStyles.medium20White),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                languageProvider.changeLanguage(context, value);
              }
            },
            hint: 'Language'.tr(),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
