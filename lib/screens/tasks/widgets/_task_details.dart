part of '../tasks.dart';

class _TaskDetails extends StatelessWidget {
  const _TaskDetails();

  @override
  Widget build(BuildContext context) {
    return Selector<_ScreenState, Task?>(
      selector: (context, state) => state.currentTask,
      builder: (context, task, child) {
        if (task == null) return const SizedBox.shrink();

        return _TaskDetailsForm(task: task);
      },
    );
  }
}

class _TaskDetailsForm extends StatefulWidget {
  final Task task;

  const _TaskDetailsForm({
    required this.task,
  });

  @override
  State<_TaskDetailsForm> createState() => _TaskDetailsFormState();
}

class _TaskDetailsFormState extends State<_TaskDetailsForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(
      text: widget.task.description ?? '',
    );

    _titleController.addListener(() {
      final screenState = _ScreenState.s(context);
      screenState.updateCurrentTask(
        _titleController.text,
        _descriptionController.text,
      );
    });

    _descriptionController.addListener(() {
      final screenState = _ScreenState.s(context);
      screenState.updateCurrentTask(
        _titleController.text,
        _descriptionController.text,
      );
    });
  }

  @override
  void didUpdateWidget(covariant _TaskDetailsForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.task.id != widget.task.id) {
      _titleController.text = widget.task.title;
      _descriptionController.text = widget.task.description ?? '';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM d, yyyy');

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleController,
            style: Theme.of(context).textTheme.headlineMedium,
            decoration: InputDecoration(
              hintText: 'Title',
              border: InputBorder.none,
            ),
          ),
          Text(
            format.format(widget.task.createdAt),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _descriptionController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Description',
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
