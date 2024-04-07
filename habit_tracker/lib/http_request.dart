import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/todo.dart';

Future<ToDo> parseJson(int id) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
  if (response.statusCode == 200) {
    //запит успішний, витягаємо json
    return ToDo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load to-do');
  }
}
