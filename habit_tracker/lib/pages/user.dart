import 'package:flutter/material.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'User Page',
          ),
          const SizedBox(height: 30.0),
          FloatingActionButton.extended(
              onPressed:
                  Provider.of<AppModel>(context, listen: false).deleteHabits,
              label: const Text("Delete all data"))
        ],
      ),
    );
  }
}
