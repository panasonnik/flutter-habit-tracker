import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/app_bar.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:provider/provider.dart';
//import 'package:habit_tracker/widgets/habit.dart';

class HabitInfoPage extends StatelessWidget {
  const HabitInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<AppModel>(context).darkTheme;
    //final appModel = Provider.of<AppModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: const MyAppBar(),
        body: Container(
          alignment: Alignment.center,
          child: const Text("Habit info page..."),
        ),
      ),
    );
  }
}
