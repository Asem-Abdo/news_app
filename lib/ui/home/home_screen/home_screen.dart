import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home/widget/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: HomeWidget(),
    );
  }
}
