part of 'bottom_bar.dart';

class _Data {
  final String title;
  final IconData icon;
  final String route;

  _Data({
    required this.title,
    required this.icon,
    required this.route,
  });
}

final list = [
  _Data(
    title: 'Tasks',
    icon: Icons.checklist_rounded,
    route: AppRoutes.tasks,
  ),
  _Data(
    title: 'Calendar',
    icon: Icons.calendar_month,
    route: AppRoutes.calendar,
  ),
  _Data(
    title: 'Pin',
    icon: Icons.location_pin,
    route: AppRoutes.pin,
  ),
  _Data(
    title: 'Profile',
    icon: Icons.person,
    route: AppRoutes.profile,
  ),
];
