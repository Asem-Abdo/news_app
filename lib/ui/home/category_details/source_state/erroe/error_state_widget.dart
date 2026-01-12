import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    super.key,
    required this.text,
    required this.textButton,
    this.onPressed,
  });
  final String text;
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(text, style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.greyColor,
            ),
            onPressed: onPressed,
            child: Text(
              textButton,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
