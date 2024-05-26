import 'package:drainblood/Features/Home/presentation/views/home_page.dart';
import 'package:flutter/widgets.dart';

class HomePageRoute {
  static const String routeName = '/home';
  static String displayName = '';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => HomePage(
            displayName: displayName,
          ),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
