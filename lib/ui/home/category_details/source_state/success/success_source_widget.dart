import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/source/source_tab.dart';

class SuccessSourceWidget extends StatelessWidget {
  const SuccessSourceWidget({
    super.key,
    required this.itemCount,
    required this.sourceList,
  });
  final int? itemCount;
  final List<Source> sourceList;

  @override
  Widget build(BuildContext context) {
    return SourceTab(sourcesList: sourceList);
  }
}
