import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:habit_tracker/models/habits_category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

class Habit extends StatelessWidget {
  const Habit({
    super.key,
    required this.categories,
    required this.selectedCategoryIndex,
    this.isHabitPressedList,
    this.index = 0,
  });

  final List<HabitsCategoryModel> categories;
  final int selectedCategoryIndex;
  final List<bool>? isHabitPressedList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, appModel, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.black, width: 2.0),
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
                      categories[selectedCategoryIndex].habits[index].name,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      categories[selectedCategoryIndex]
                          .habits[index]
                          .description,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        appModel.addHabit(
                            categories[selectedCategoryIndex].habits[index]);
                        // Toggle the pressed state of the current habit button
                        isHabitPressedList![index] =
                            !isHabitPressedList![index];
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(100.0, 10.0),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: isHabitPressedList![index]
                          ? SvgPicture.asset(
                              "assets/icons/check.svg",
                              height: 24.0,
                            )
                          : const Text("Add"),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: CachedNetworkImage(
                  imageUrl:
                      categories[selectedCategoryIndex].habits[index].imagePath,
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
