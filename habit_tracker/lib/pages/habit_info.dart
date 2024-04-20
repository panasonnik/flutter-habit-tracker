import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:provider/provider.dart';

class HabitInfoPage extends StatelessWidget {
  const HabitInfoPage({super.key, required this.habit});
  final Habit habit;
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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text("See info: ", style: TextStyle(fontSize: 20.0)),
              const SizedBox(height: 30.0),
              Text(habit.name,
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20.0),
              Text(habit.description),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"))
            ],
          ),
        ),
      ),
    );
  }
}
