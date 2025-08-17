class Task {
  final int id;
  final String title;
  final String? description;
  final DateTime createdAt;
  final bool completed;

  const Task({
    required this.id,
    required this.title,
    this.description,
    required this.createdAt,
    this.completed = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      completed: json['completed'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'completed': completed,
    };
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, createdAt: $createdAt, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.completed == completed;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      createdAt.hashCode ^
      completed.hashCode;
}
