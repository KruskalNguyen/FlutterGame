import 'package:drainblood/Features/ChooseWeapon/presentation/view/choose_weapon.dart';
import 'package:flutter/widgets.dart';

class ChooseWeaponRoute {
  static const String routeName = '/choosewp';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => ChooseWeapon(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
