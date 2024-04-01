import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "TrackHabits",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 40.0,
          decoration: const BoxDecoration(
            color: Color(0xfff5f5f5),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: SvgPicture.asset(
            "assets/icons/plus.svg",
            width: 20.0,
          ),
        ),
      ],
    );
  }
}
