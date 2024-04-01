import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:habit_tracker/models/habits_category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart'; // Import Provider

class HabitsPage extends StatefulWidget {
  const HabitsPage({super.key});

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {
  List<HabitsCategoryModel> categories = [];
  int selectedCategoryIndex = 0;

  _getCategories() {
    categories = HabitsCategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    List<bool> isHabitPressedList = List.generate(
      categories[selectedCategoryIndex].habits.length,
      (index) => false,
    );
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 10.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  width: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: selectedCategoryIndex == index
                          ? Colors.transparent // Selected category border color
                          : Colors.black, // Non-selected category border color
                      width: 2.0,
                    ),
                    color: selectedCategoryIndex == index
                        ? const Color.fromARGB(255, 188, 232,
                            55) // Selected category background color
                        : Colors
                            .transparent, // Non-selected category background color
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categories[index].title,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          child: ListView.separated(
            itemCount: categories[selectedCategoryIndex].habits.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20.0),
            itemBuilder: (context, index) {
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
                                categories[selectedCategoryIndex]
                                    .habits[index]
                                    .name,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                categories[selectedCategoryIndex]
                                    .habits[index]
                                    .description,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  appModel.addHabit(
                                      categories[selectedCategoryIndex]
                                          .habits[index]);

                                  // Toggle the pressed state of the current habit button
                                  isHabitPressedList[index] =
                                      !isHabitPressedList[index];
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                    Size(100.0, 10.0),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: isHabitPressedList[index]
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
                            imageUrl: categories[selectedCategoryIndex]
                                .habits[index]
                                .imagePath,
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor:
                                  const Color.fromARGB(255, 186, 139, 194),
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
            },
          ),
        ),
      ],
    );
  }
}
