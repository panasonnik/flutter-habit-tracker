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
          imagePath:
              "https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?q=80&w=1973&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      Habit(
          name: "Learn language",
          description: "Description",
          imagePath:
              "https://images.unsplash.com/photo-1543165796-5426273eaab3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    ]));
    categories.add(HabitsCategoryModel(title: "Food", habits: [
      Habit(
          name: "Eat healthy",
          description: "Description",
          imagePath:
              "https://plus.unsplash.com/premium_photo-1666275003927-47bea5a1fb0b?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      Habit(
          name: "Drink water",
          description: "Description",
          imagePath:
              "https://images.unsplash.com/photo-1602904761432-f9ad96133982?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    ]));

    return categories;
  }
}
