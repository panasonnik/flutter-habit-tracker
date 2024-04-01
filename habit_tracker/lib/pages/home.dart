import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
    );
  }
}
