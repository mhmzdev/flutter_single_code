import 'package:flutter/foundation.dart';
import 'package:flutter_single_code/models/task.dart';

class Category {
  final int id;
  final String name;
  final List<Task> tasks;

  const Category({
    required this.id,
    required this.name,
    required this.tasks,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((task) => Task.fromJson(task as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tasks': tasks.map((task) => task.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category &&
        other.id == id &&
        other.name == name &&
        listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ tasks.hashCode;
}
