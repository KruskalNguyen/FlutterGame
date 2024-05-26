import 'package:drainblood/Features/Battle/presentation/view/island_map/island_map.dart';
import 'package:flutter/widgets.dart';

class IslandMapRoute {
  static const String routeName = '/island-map';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => const IslandMap(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
