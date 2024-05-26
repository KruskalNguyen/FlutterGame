import 'package:drainblood/Features/Gacha/presentation/view/gacha_page.dart';
import 'package:flutter/widgets.dart';

class GachaPageRoute {
  static const String routeName = '/gacha';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) =>  GachaPage(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
