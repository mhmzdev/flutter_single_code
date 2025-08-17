import 'package:flutter/material.dart';
import 'package:flutter_single_code/screens/calendar/calendar.dart';
import 'package:flutter_single_code/screens/login/login.dart';
import 'package:flutter_single_code/screens/pin/pin.dart';
import 'package:flutter_single_code/screens/profile/profile.dart';
import 'package:flutter_single_code/screens/tasks/tasks.dart';

import 'routes.dart';

final appRoutes = {
  AppRoutes.login: (context) => const LoginScreen(),
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.tasks:
      return FadeRoute(child: const TasksScreen(), settings: settings);
    case AppRoutes.pin:
      return FadeRoute(child: const PinScreen(), settings: settings);
    case AppRoutes.calendar:
      return FadeRoute(child: const CalendarScreen(), settings: settings);
    case AppRoutes.profile:
      return FadeRoute(child: const ProfileScreen(), settings: settings);
    default:
      return FadeRoute(child: const LoginScreen(), settings: settings);
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({
    required this.child,
    required this.settings,
  }) : super(
         settings: settings,
         pageBuilder: (context, ani1, ani2) => child,
         transitionsBuilder: (context, ani1, ani2, child) {
           return FadeTransition(
             opacity: ani1,
             child: child,
           );
         },
       );
}
