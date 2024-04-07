import 'package:flutter/material.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    return AppBar(
      title: const Text(
        "TrackHabits",
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.scale(
                scale: 0.8, // Adjusted scale to make the switch smaller
                child: Switch(
                  value: appModel.darkTheme,
                  onChanged: (value) {
                    appModel.darkTheme = value;
                  },
                  activeColor: Colors.black54,
                  activeTrackColor: Colors.black45,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
