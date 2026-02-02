import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home/widget/view_item.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning \nHere is Some News For You',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 15),
          Expanded(child: ViewItem()),
        ],
      ),
    );
  }
}
