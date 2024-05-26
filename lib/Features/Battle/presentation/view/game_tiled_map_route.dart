import 'package:drainblood/Features/Battle/presentation/view/game_tiled_map.dart';
import 'package:flutter/widgets.dart';

class GameTiledMapRoute {
  static const String routeName = '/game-tiles';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => const GameTiledMap(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
