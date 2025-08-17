part of '../tasks.dart';

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _CategoriesList()),
          Expanded(flex: 2, child: _TasksList()),
          Expanded(child: _TaskDetails()),
        ],
      ),
    );
  }
}
