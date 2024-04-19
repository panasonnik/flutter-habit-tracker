import 'package:flutter/material.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:habit_tracker/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:habit_tracker/widgets/habit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    List<bool> isHabitPressedList = List.generate(
      appModel.habits.length,
      (index) => false,
    );
    if (appModel.habits.isEmpty) {
      // If habits is null or empty, return an empty SizedBox
      return const Scaffold(
        body: Center(
          child: Text("You haven't added habits yet..."),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.separated(
        itemCount: appModel.habits.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20.0),
        itemBuilder: (context, index) {
          return HabitWidget(
            pathToHabit: appModel.habits[index],
            action: "Delete",
            hasInfoBtn: true,
            isHabitPressedList: isHabitPressedList,
          );
        },
      ),
    );
  }
}
