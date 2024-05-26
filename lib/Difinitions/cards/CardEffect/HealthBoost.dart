import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:drainblood/Difinitions/cards/cards_ui/card_ui.dart';
import 'package:drainblood/Features/Battle/presentation/widget/show_image_card.dart';

class HealthBoost {
  static const String name = 'HealthBoost';
  static ShowImageCart showImageCart = ShowImageCart(
    path: '/assets/cards/heath_boost.jpg',
  );
  CardUI cardUI = CardUI(
      cardType: 'Heroic',
      cardName: 'Health Boost',
      description: 'Increase max HP of 50 point, and heal self 50 HP ',
      linkImage: '/assets/cards/heath_boost.jpg');
  void cardEffect(Knight player) {
    player.initialLife(player.maxLife + 50);
    player.addLife(-50);
  }
}
