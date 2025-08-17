import 'package:flutter/material.dart';

import '../bottom_bar/bottom_bar.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.body,
    this.bottomBar = false,
    this.drawer,
    this.endDrawer,
  });

  final Widget body;
  final bool bottomBar;
  final Widget? drawer;
  final Widget? endDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      drawer: drawer,
      bottomNavigationBar: bottomBar ? const BottomBar() : null,
      endDrawer: endDrawer,
    );
  }
}
