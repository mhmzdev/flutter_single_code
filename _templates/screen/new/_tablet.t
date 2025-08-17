---
to: lib/screens/<%= h.changeCase.snake(name) %>/views/_tablet.dart
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Tablet extends StatelessWidget {
  const _Tablet();

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
