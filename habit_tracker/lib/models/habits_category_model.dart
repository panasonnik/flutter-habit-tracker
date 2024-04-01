import 'package:habit_tracker/models/habit.dart';

class HabitsCategoryModel {
  String title;
  List<Habit> habits;

  HabitsCategoryModel({
    required this.title,
    required this.habits,
  });

  static List<HabitsCategoryModel> getCategories() {
    List<HabitsCategoryModel> categories = [];

    categories.add(HabitsCategoryModel(title: "Sport", habits: [
      Habit(
          name: "Regular exercise",
          description: "Description",
          imagePath:
              "https://plus.unsplash.com/premium_photo-1679938885972-180ed418f466?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      Habit(
          name: "Yoga",
          description: "Description",
          imagePath:
              "https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    ]));

    categories.add(HabitsCategoryModel(title: "Education", habits: [
      Habit(
          name: "Study",
          description: "Description",
          imagePath: "assets/icons/house.svg"),
      Habit(
          name: "Bla bla bla",
          description: "Description",
          imagePath: "assets/icons/house.svg")
    ]));
    categories.add(HabitsCategoryModel(title: "Health", habits: [
      Habit(
          name: "Regular exercise",
          description: "Description",
          imagePath: "assets/icons/house.svg"),
      Habit(
          name: "Yoga",
          description: "Description",
          imagePath: "assets/icons/house.svg")
    ]));
    categories.add(HabitsCategoryModel(title: "Food", habits: [
      Habit(
          name: "Regular exercise",
          description: "Description",
          imagePath: "assets/icons/house.svg"),
      Habit(
          name: "Yoga",
          description: "Description",
          imagePath: "assets/icons/house.svg")
    ]));

    return categories;
  }
}
