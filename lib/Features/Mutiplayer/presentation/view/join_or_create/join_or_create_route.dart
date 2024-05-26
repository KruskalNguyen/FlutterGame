import 'package:drainblood/Features/Mutiplayer/presentation/view/join_or_create/join_or_create.dart';
import 'package:flutter/widgets.dart';

class JoinOrCreateRoute {
  static const String routeName = '/JoinOrCreate';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => JoinOrCreate(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
