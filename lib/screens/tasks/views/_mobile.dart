part of '../tasks.dart';

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Screen(
      bottomBar: true,
      drawer: Drawer(
        child: SafeArea(child: _CategoriesList()),
      ),
      body: SafeArea(child: _TasksList()),
    );
  }
}
