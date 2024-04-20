import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:habit_tracker/pages/info.dart';
import 'package:provider/provider.dart';

import 'widgets/app_bar.dart';

import 'package:habit_tracker/pages/home.dart';
import 'package:habit_tracker/pages/habits.dart';
import 'package:habit_tracker/pages/progress.dart';
import 'package:habit_tracker/pages/user.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp(),
        '/home': (context) => const HomePage(),
        '/habits': (context) => const HabitsPage(),
        '/todo': (context) => const ProgressPage(),
        '/account': (context) => const UserPage(),
        '/info': (context) => const InfoPage(),
      },
    ),
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

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 4);
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
    return Scaffold(
      appBar: const MyAppBar(),
      body: TabBarView(
        controller: _controller,
        children: const [
          PageNavigator(
            myPage: HomePage(),
          ),
          PageNavigator(myPage: HabitsPage()),
          PageNavigator(myPage: ProgressPage()),
          PageNavigator(myPage: UserPage()),
        ],
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

class PageNavigator extends StatelessWidget {
  const PageNavigator({super.key, required this.myPage});
  final Widget myPage;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => myPage,
        );
      },
    );
  }
}
