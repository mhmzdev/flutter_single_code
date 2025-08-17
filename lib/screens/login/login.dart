import 'package:flutter/material.dart';
import 'package:flutter_single_code/router/routes.dart';
import 'package:flutter_single_code/services/responsive.dart';
import 'package:flutter_single_code/widgets/screen/screen.dart';
import 'package:provider/provider.dart';

part 'views/_desktop.dart';

part '_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _ScreenState(),
      child: Responsive(
        /// An example of ONE VIEW being used for all, you don't need every view
        /// if one can play the role for all of them.
        ///
        /// You can also use the Responsive widget to create a different view for
        /// each screen size.
        mobile: _Desktop(),
        tablet: _Desktop(),
        desktop: _Desktop(),
      ),
    );
  }
}
