import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:drainblood/Difinitions/cards/cards_ui/card_ui.dart';
import 'package:drainblood/Features/Battle/presentation/widget/show_image_card.dart';

class RangeBoost {
  static const String name = 'HealthBoost';
  static ShowImageCart showImageCart = ShowImageCart(
    path: '/assets/cards/range_boost.jpg',
  );
  CardUI cardUI = CardUI(
      cardType: 'Legendary',
      cardName: 'Range Boost',
      description: 'Increase slash range for next 5 slashes',
      linkImage: '/assets/cards/range_boost.jpg');
  int numAttack = 0;
  void cardEffect(Knight player) {
    double range = player.radAngleRangeAttack;
    if (numAttack < 6) {
      player.radAngleRangeAttack = range + 10;
    } else
      player.radAngleRangeAttack = range;
  }
}
