import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/ui/home/category_details/source_state/erroe/error_state_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/success/success_source_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/waiting/waiting_state_widget.dart';
import 'package:news_app/ui/home/category_details/sources_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});
  final Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourcesViewModel viewModel = SourcesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            /// error
            return ErrorStateWidget(
              text: viewModel.errorMessage!,
              textButton: "Retry".tr(),
              onPressed: () {
                viewModel.getSources(widget.category.id);
              },
            );
          } else if (viewModel.sourcesList == null) {
            /// loading
            return WaitingStateWidget();
          }
          /// success
          else {
            return SuccessSourceWidget(
              itemCount: viewModel.sourcesList!.length,
              sourceList: viewModel.sourcesList!,
            );
          }
        },
      ),
    );
  }
}
