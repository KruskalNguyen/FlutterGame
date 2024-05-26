import 'package:drainblood/Features/Mutiplayer/presentation/view/lobby/muti_player_page.dart';
import 'package:flutter/widgets.dart';

class MutiPlayerRoute {
  static const String routeName = '/mutiplayer';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => MutiPlayerPage(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
