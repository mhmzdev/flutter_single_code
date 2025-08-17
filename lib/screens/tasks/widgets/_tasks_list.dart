part of '../tasks.dart';

class _TasksList extends StatefulWidget {
  const _TasksList();

  @override
  State<_TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<_TasksList> {
  final _addController = TextEditingController();

  @override
  void dispose() {
    _addController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final category = screenState.category;
    final tasks = category.tasks;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (Responsive.isMobile(context))
                IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(Icons.menu),
                ),
              Text(
                category.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _addController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add),
              hintText: 'Add a new task',
              border: OutlineInputBorder(),
            ),
            onFieldSubmitted: (title) {
              if (title.isEmpty) return;
              screenState.addTask(title);
              _addController.clear();
            },
          ),
          SizedBox(
            height: 16,
          ),
          ...tasks.map(
            (task) => ListTile(
              leading: Checkbox(
                value: task.completed,
                onChanged: (value) {
                  screenState.setCurrentTask(task);
                  screenState.updateCurrentTask(
                    task.title,
                    task.description,
                    value,
                  );
                },
              ),
              title: Text(task.title),
              onTap: () {
                screenState.setCurrentTask(task);
                if (Responsive.isTablet(context)) {
                  Scaffold.of(context).openEndDrawer();
                } else if (Responsive.isMobile(context)) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) {
                      return ListenableProvider.value(
                        value: screenState,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Material(
                            color: Colors.white,
                            elevation: 0,
                            child: _TaskDetailsForm(task: task),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
