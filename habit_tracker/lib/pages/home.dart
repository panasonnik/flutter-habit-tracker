import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';

class HomePage extends StatelessWidget {
  final List<Habit> habits;
  const HomePage({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    if (habits == null || habits!.isEmpty) {
      // If habits is null or empty, return an empty SizedBox
      return SizedBox.shrink();
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.separated(
            itemCount: habits.length,
            separatorBuilder: (context, index) => SizedBox(height: 20.0),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.black, // Non-selected category border color
                    width: 2.0,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  habits[index].name,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
