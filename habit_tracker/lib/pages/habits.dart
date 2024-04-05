import 'package:flutter/material.dart';

import 'package:habit_tracker/models/habits_category_model.dart';
import 'package:habit_tracker/widgets/habit.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({super.key});

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {
  late List<HabitsCategoryModel> categories;
  int selectedCategoryIndex = 0;

  void _getCategories() {
    categories = HabitsCategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    List<bool> isHabitPressedList = List.generate(
      categories[selectedCategoryIndex].habits.length,
      (index) => false,
    );
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 10.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  width: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: selectedCategoryIndex == index
                          ? Colors.transparent // Selected category border color
                          : Colors.black, // Non-selected category border color
                      width: 2.0,
                    ),
                    color: selectedCategoryIndex == index
                        ? const Color.fromARGB(255, 188, 232,
                            55) // Selected category background color
                        : Colors
                            .transparent, // Non-selected category background color
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categories[index].title,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          child: ListView.separated(
            itemCount: categories[selectedCategoryIndex].habits.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20.0),
            itemBuilder: (context, index) {
              return Habit(
                categories: categories,
                selectedCategoryIndex: selectedCategoryIndex,
                isHabitPressedList: isHabitPressedList,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
