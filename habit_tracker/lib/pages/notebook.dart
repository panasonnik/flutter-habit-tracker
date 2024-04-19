import 'package:flutter/material.dart';
import 'package:habit_tracker/app_model.dart';
import 'package:habit_tracker/widgets/app_bar.dart';
import 'package:provider/provider.dart';
//import 'package:habit_tracker/widgets/habit.dart';

class NotebookPage extends StatelessWidget {
  final TextEditingController _notesController = TextEditingController();
  NotebookPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Provider.of<AppModel>(context).darkTheme;
    //final appModel = Provider.of<AppModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: const MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Write your notes:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _notesController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your notes here...",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _returnNotes(context);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _returnNotes(BuildContext context) {
    final String notes = _notesController.text;
    Navigator.pop(context, notes);
  }
}
