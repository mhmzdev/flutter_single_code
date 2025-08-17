part of '../tasks.dart';

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final currentTask = screenState.currentTask;
    return Screen(
      endDrawer: Drawer(
        child: currentTask == null
            ? null
            : _TaskDetailsForm(
                task: currentTask,
              ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _CategoriesList()),
          Expanded(flex: 2, child: _TasksList()),
        ],
      ),
    );
  }
}
