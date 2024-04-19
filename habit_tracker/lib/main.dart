import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:habit_tracker/pages/notebook.dart';
import 'package:provider/provider.dart';

import 'widgets/app_bar.dart';

import 'package:habit_tracker/pages/home.dart';
import 'package:habit_tracker/pages/habits.dart';
import 'package:habit_tracker/pages/progress.dart';
import 'package:habit_tracker/pages/user.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int _selectedItem = 0;

  late TabController _controller;
  late List<Widget> _pages;

  @override
  void initState() {
    _pages = const [
      HomePage(),
      HabitsPage(),
      ProgressPage(),
      UserPage(),
    ];
    super.initState();
    _controller = TabController(vsync: this, length: _pages.length);

    _controller.addListener(() {
      _selectedItem = _controller.index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
      _controller.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<AppModel>(context).darkTheme;
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
          child: TabBarView(
            controller: _controller,
            children: [
              ..._pages,
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80.0,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              _buildBottomNavigationBarItem(
                iconPath: "assets/icons/house.svg",
                label: "Home",
                index: 0,
                isDarkTheme: isDarkTheme,
              ),
              _buildBottomNavigationBarItem(
                iconPath: "assets/icons/compass.svg",
                label: "Habits",
                index: 1,
                isDarkTheme: isDarkTheme,
              ),
              _buildBottomNavigationBarItem(
                iconPath: "assets/icons/bars-progress.svg",
                label: "Progress",
                index: 2,
                isDarkTheme: isDarkTheme,
              ),
              _buildBottomNavigationBarItem(
                iconPath: "assets/icons/user.svg",
                label: "Profile",
                index: 3,
                isDarkTheme: isDarkTheme,
              ),
            ],
            backgroundColor: const Color(0xfff2f2f2),
            selectedItemColor: isDarkTheme ? Colors.white : Colors.black,
            onTap: _onItemTapped,
            currentIndex: _selectedItem,
            elevation: 0, // Remove shadow
            iconSize: 30.0,
          ),
        ),
      ),
    );
  }

  // Function to build BottomNavigationBarItem
  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String iconPath,
    required String label,
    required int index,
    required bool isDarkTheme,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        height: 30.0,
        color: _selectedItem == index
            ? isDarkTheme
                ? const Color.fromARGB(255, 188, 232, 55)
                : const Color.fromARGB(255, 188, 232, 55)
            : isDarkTheme
                ? Colors.white
                : Colors.black,
      ),
      label: label,
    );
  }
}
