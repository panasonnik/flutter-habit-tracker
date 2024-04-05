import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends ChangeNotifier {
  bool _darkTheme = false;

  final List<Habit> _habits = [];

  UnmodifiableListView<Habit> get habits => UnmodifiableListView(_habits);
  bool get darkTheme => _darkTheme;
  set darkTheme(bool val) {
    _darkTheme = val;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('darkTheme', _darkTheme);
    });
    notifyListeners();
  }

  getDarkTheme() {
    SharedPreferences.getInstance().then((prefs) {
      _darkTheme = prefs.getBool('darkTheme') ?? false;
    });
    notifyListeners();
  }

  void addHabit(Habit h) {
    _habits.add(h);
    notifyListeners();
  }

  void removeHabit(Habit h) {
    _habits.remove(h);
    notifyListeners();
  }

  void deleteHabits() {
    _habits.clear();
  }
}
