import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:drainblood/Difinitions/cards/cards_ui/card_ui.dart';
import 'package:drainblood/Features/Battle/presentation/widget/show_image_card.dart';

class AttackBoost {
  int numAttack = 0;
  static const String name = 'AttackBoost';
  static ShowImageCart showImageCart = ShowImageCart(
    path: 'assets/cards/attack_boost.jpg',
  );
  CardUI cardUI = CardUI(
      cardType: 'Epic',
      cardName: 'Attack Boost',
      description: 'Increase attack for next 3 slashes',
      linkImage: '/assets/cards/attack_boost.jpg');

  void cardEffect(Knight player) {
    double attack = player.attack;
    if (numAttack < 4) {
      player.attack = attack + 20;
    } else
      player.attack = attack;
  }
}
