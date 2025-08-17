import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key, this.mobile, this.tablet, this.desktop})
    : assert(
        mobile != null || tablet != null || desktop != null,
        'At least one widget must be provided',
      );

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  /// Bootstrap breakpoints
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 576;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 576 &&
      MediaQuery.of(context).size.width < 768;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop(context)) {
          return desktop!;
        } else if (isTablet(context)) {
          return tablet!;
        } else {
          return mobile!;
        }
      },
    );
  }
}
