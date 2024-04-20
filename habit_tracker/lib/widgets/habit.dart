import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:habit_tracker/pages/habit_info.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

class HabitWidget extends StatelessWidget {
  const HabitWidget(
      {super.key,
      required this.pathToHabit,
      required this.isHabitPressedList,
      this.index = 0,
      this.action = "Add",
      this.hasInfoBtn = false});

  final Habit pathToHabit;
  final List<bool> isHabitPressedList;
  final int index;
  final String action;
  final bool hasInfoBtn;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, appModel, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
                color: appModel.darkTheme ? Colors.white : Colors.black,
                width: 2.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pathToHabit.name,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      pathToHabit.description,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: isHabitPressedList[index]
                          ? null // Button is disabled if already pressed
                          : () {
                              if (action == "Delete") {
                                appModel.removeHabit(pathToHabit);
                              } else {
                                appModel.addHabit(pathToHabit);
                              }

                              isHabitPressedList[index] = true;
                            },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          const Size(100.0, 10.0),
                        ),
                        backgroundColor: appModel.darkTheme
                            ? MaterialStateProperty.all(Colors.white)
                            : MaterialStateProperty.all(Colors.black12),
                      ),
                      child: isHabitPressedList[index] && action == "Add"
                          ? SvgPicture.asset(
                              "assets/icons/check.svg",
                              height: 24.0,
                            )
                          : Text(action,
                              style: const TextStyle(color: Colors.black)),
                    ),
                    if (hasInfoBtn)
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HabitInfoPage(habit: pathToHabit),
                            ),
                          );
                        },
                        child: const Text('See habit info'),
                      ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: CachedNetworkImage(
                  imageUrl: pathToHabit.imagePath,
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: const Color.fromARGB(255, 186, 139, 194),
                    child: Container(
                      width: 150.0,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
