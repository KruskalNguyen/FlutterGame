import 'package:drainblood/Features/Profile/presentation/views/profile_page.dart';
import 'package:flutter/widgets.dart';

class ProfilePageRoute {
  static const String routeName = '/profile';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => const Profile(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}