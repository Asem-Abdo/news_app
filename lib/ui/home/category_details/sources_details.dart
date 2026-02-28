import 'package:flutter/material.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/di/di_injiectable.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/ui/home/category_details/cubit/sources_state.dart';
import 'package:news_app/ui/home/category_details/source_state/erroe/error_state_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/success/success_source_widget.dart';
import 'package:news_app/ui/home/category_details/source_state/waiting/waiting_state_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/sources_view_model.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});
  final Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourcesViewModel viewModel = getIt<SourcesViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesViewModel, SourcesStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceErrorState) {
          return ErrorStateWidget(
            text: state.errorMessage,
            textButton: "Retry",
            onPressed: () {
              viewModel.getSources(widget.category.id);
            },
          );
        } else if (state is SourceSuccessState) {
          return SuccessSourceWidget(
            itemCount: state.sourcesList.length,
            sourceList: state.sourcesList,
          );
        } else {
          return WaitingStateWidget();
        }
      },
    );
  }
}
