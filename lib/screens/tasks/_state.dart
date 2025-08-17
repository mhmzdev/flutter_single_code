part of 'tasks.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  Category category = mockCategories.first;

  void setCategory(Category category) {
    this.category = category;
    notifyListeners();
  }

  void addTask(String title) {
    final task = Task(
      id: Random().nextInt(1000000),
      title: title,
      completed: false,
      createdAt: DateTime.now(),
    );
    category.tasks.add(task);
    notifyListeners();
  }

  Task? currentTask;

  void setCurrentTask(Task? task) {
    currentTask = task;
    notifyListeners();
  }

  void updateCurrentTask(String title, String? description, [bool? completed]) {
    currentTask = currentTask?.copyWith(
      title: title,
      description: description,
      completed: completed,
    );
    final index = category.tasks.indexWhere((t) => t.id == currentTask?.id);
    if (index != -1) {
      category.tasks[index] = currentTask!;
    }
    notifyListeners();
  }
}
