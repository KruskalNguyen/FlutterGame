import 'package:drainblood/Features/Login/presentation/View/login_page.dart';
import 'package:flutter/widgets.dart';

class LoginPageRoute {
  static const String routeName = '/login';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => const LoginPage(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
