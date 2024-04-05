class Habit {
  final String _name;
  final String _description;
  final String _imagePath;

  Habit({
    required String name,
    required String description,
    required String imagePath,
  })  : _name = name,
        _description = description,
        _imagePath = imagePath;

  String get name => _name;

  String get description => _description;

  String get imagePath => _imagePath;
}
