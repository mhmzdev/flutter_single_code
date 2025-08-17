import 'package:flutter/material.dart';
import 'package:flutter_single_code/services/responsive.dart';
import 'package:provider/provider.dart';

part 'views/_desktop.dart';
part 'views/_mobile.dart';
part 'views/_tablet.dart';

part '_state.dart';

/// {@template login}
/// LoginScreen widget.
/// {@endtemplate}
class LoginScreen extends StatelessWidget {
  /// {@macro login}
  const LoginScreen({
    super.key, // ignore: unused_element
  });

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
