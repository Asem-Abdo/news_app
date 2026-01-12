import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/news/news_widget.dart';
import 'package:news_app/ui/home/source/source_name.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTab extends StatefulWidget {
  SourceTab({super.key, required this.sourcesList});

  final List<Source> sourcesList;

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Theme.of(context).hoverColor,
            dividerColor: AppColors.transparentColor,
            tabAlignment: TabAlignment.start,
            tabs: widget.sourcesList.map((source) {
              return SourceName(
                source: source,
                isSelected: selectedIndex == widget.sourcesList.indexOf(source),
              );
            }).toList(),
          ),
          Expanded(
            child: NewsWidget(source: widget.sourcesList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
