import 'package:flutter/material.dart';
import 'package:habit_tracker/http_request.dart';
import 'package:habit_tracker/models/todo.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  late List<Future<ToDo>> toDoList = [];
  int toDoId = 1;

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 5; i++) {
      toDoList.add(parseJson(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'To Do',
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
          ),
          FutureBuilder<List<ToDo>>(
            future: Future.wait(toDoList),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ToDo> todos = snapshot.data!;
                return Column(
                  children: todos.map((todo) {
                    return Row(
                      children: [
                        Checkbox(
                          value: todo.completed,
                          onChanged: (bool? value) {
                            debugPrint(value.toString());
                          },
                        ),
                        const SizedBox(width: 30.0),
                        Expanded(
                          child: Text(todo.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.0)),
                        ),
                      ],
                    );
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
