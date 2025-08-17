---
to: lib/screens/<%= h.changeCase.snake(name) %>/views/_mobile.dart
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _Header(),
          ],
        ),
      ),
    );
  }
}
