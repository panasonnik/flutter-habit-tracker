import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habits_category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class HabitsPage extends StatefulWidget {
  final Function addHabitFunction;
  const HabitsPage({super.key, required this.addHabitFunction});

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
    return Column(
      children: [
        SizedBox(height: 10.0),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 10.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => SizedBox(width: 20.0),
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
                        ? Color.fromARGB(255, 188, 232,
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
        SizedBox(height: 20.0),
        Expanded(
          child: ListView.separated(
            itemCount: categories[selectedCategoryIndex].habits.length,
            separatorBuilder: (context, index) => SizedBox(height: 20.0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.addHabitFunction(
                      categories[selectedCategoryIndex].habits[index]);
                },
                child: Container(
                  height: 100,
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        categories[selectedCategoryIndex].habits[index].name,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      ),
                      CachedNetworkImage(
                        imageUrl: categories[selectedCategoryIndex]
                            .habits[index]
                            .imagePath,
                        width: 180.0,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: Colors.purple,
                          child: Container(
                            width: 180.0,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
