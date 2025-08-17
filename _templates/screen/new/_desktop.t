---
to: lib/screens/<%= h.changeCase.snake(name) %>/views/_desktop.dart
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _Header(),
        ],
      ),
    );
  }
}
