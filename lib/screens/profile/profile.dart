import 'package:flutter_single_code/services/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_single_code/widgets/screen/screen.dart';
import 'package:provider/provider.dart';

part 'views/_desktop.dart';
part 'views/_mobile.dart';
part 'views/_tablet.dart';

part 'widgets/_header.dart';

part '_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const Responsive(
        mobile: _Mobile(),
        desktop: _Desktop(),
        tablet: _Tablet(),
      ),
    );
  }
}
