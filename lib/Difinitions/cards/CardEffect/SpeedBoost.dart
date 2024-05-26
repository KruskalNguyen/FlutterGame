import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:drainblood/Difinitions/cards/cards_ui/card_ui.dart';
import 'package:drainblood/Features/Battle/presentation/widget/show_image_card.dart';

class SpeedBoost {
  static const String name = 'SpeedBoost';
  static ShowImageCart showImageCart = ShowImageCart(
    path: '/assets/cards/speed_boost.jpg',
  );
  CardUI cardUI = CardUI(
      cardType: 'Common',
      cardName: 'Speed Boost',
      description: 'Increase speed for 3 seconds',
      linkImage: '/assets/cards/speed_boost.jpg');

  void cardEffect(Knight player) {
    double speed = player.speed;
    player.speed = speed + 5;
    Future.delayed(Duration(seconds: 3), () {
      player.speed = speed;
    });
  }
}
