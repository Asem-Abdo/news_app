import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/source_state/erroe/error_state_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/success/success_source_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/waiting/waiting_state_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        /// loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return WaitingStateWidget();
        }
        /// error => Client
        else if (snapshot.hasError) {
          return ErrorStateWidget(
            text: "Something went wrong.".tr(),
            textButton: "Retry".tr(),
            onPressed: () {
              ApiManager.getSources();
              setState(() {});
            },
          );
        }
        /// server => response  => success , error
        /// error
        else if (snapshot.data?.status != 'ok') {
          return ErrorStateWidget(
            text: snapshot.data!.message!,
            textButton: "Retry".tr(),
            onPressed: () {
              ApiManager.getSources();
              setState(() {});
            },
          );
        }

        ///success
        var sourceList = snapshot.data?.sources ?? [];
        return SuccessSourceWidget(
          itemCount: sourceList.length,
          sourceList: sourceList,
        );
      },
    );
  }
}
