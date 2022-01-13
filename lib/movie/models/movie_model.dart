import 'dart:convert';

class MovieModel {
  final String name;
  final int age;

  MovieModel({
    required this.name,
    required this.age,
  });

  factory MovieModel.fromMap(dynamic json) => MovieModel(
        name: json['name'],
        age: json['age']?.toInt(),
      );

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() => 'MovieModel(name: $name, age: $age)';
}
