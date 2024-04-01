import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';

class AppModel extends ChangeNotifier {
  final List<Habit> _habits = [];

  UnmodifiableListView<Habit> get habits => UnmodifiableListView(_habits);

  void addHabit(Habit h) {
    _habits.add(h);
    notifyListeners();
  }

  void removeHabit(Habit h) {
    _habits.remove(h);
    notifyListeners();
  }
}
