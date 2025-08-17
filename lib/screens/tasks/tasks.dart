import 'package:flutter/material.dart';
import 'package:flutter_single_code/services/responsive.dart';
import 'package:provider/provider.dart';

part 'views/_desktop.dart';
part 'views/_mobile.dart';
part 'views/_tablet.dart';

part '_state.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: Responsive(
        mobile: _Mobile(),
        tablet: _Tablet(),
        desktop: _Desktop(),
      ),
    );
  }
}
