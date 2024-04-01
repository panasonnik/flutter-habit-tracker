import 'package:flutter/material.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    if (appModel.habits.isEmpty) {
      // If habits is null or empty, return an empty SizedBox
      return const Center(
        child: Text("You haven't added habits yet..."),
      );
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.separated(
            itemCount: appModel.habits.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20.0),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.black, // Non-selected category border color
                    width: 2.0,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  appModel.habits[index].name,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
