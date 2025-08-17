part of '../profile.dart';

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Screen(
      bottomBar: true,
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
