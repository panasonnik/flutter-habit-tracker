import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:provider/provider.dart';

import 'widgets/app_bar.dart';

import 'package:habit_tracker/pages/home.dart';
import 'package:habit_tracker/pages/habits.dart';
import 'package:habit_tracker/pages/progress.dart';
import 'package:habit_tracker/pages/user.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppModel(), child: const MyApp()));
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
    _pages = [
      const HomePage(),
      const HabitsPage(),
      const ProgressPage(),
      const UserPage(),
    ];
    super.initState();
    _controller = TabController(vsync: this, length: _pages.length);

    _controller.addListener(() {
      setState(() {
        _selectedItem = _controller.index;
      });
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
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
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/house.svg",
                  height: 30.0,
                  color: _selectedItem == 0
                      ? const Color.fromARGB(255, 188, 232, 55)
                      : Colors.black,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/compass.svg",
                  height: 30.0,
                  color: _selectedItem == 1
                      ? const Color.fromARGB(255, 188, 232, 55)
                      : Colors.black,
                ),
                label: "Habits",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/bars-progress.svg",
                  height: 30.0,
                  color: _selectedItem == 2
                      ? const Color.fromARGB(255, 188, 232, 55)
                      : Colors.black,
                ),
                label: "Progress",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/user.svg",
                  height: 30.0,
                  color: _selectedItem == 3
                      ? const Color.fromARGB(255, 188, 232, 55)
                      : Colors.black,
                ),
                label: "Profile",
              ),
            ],
            backgroundColor: const Color(0xfff2f2f2),
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
            currentIndex: _selectedItem,
            elevation: 0, // Remove shadow
            iconSize: 30.0,
          ),
        ),
      ),
    );
  }
}
