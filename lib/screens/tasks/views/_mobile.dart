part of '../tasks.dart';

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: _CategoriesList(),
      ),
      body: _TasksList(),
    );
  }
}
