import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:drainblood/Difinitions/cards/cards_ui/card_ui.dart';
import 'package:drainblood/Features/Battle/presentation/widget/show_image_card.dart';

class EnergyRecovery {
  static const String name = 'EnergyRecovery';
  static ShowImageCart showImageCart = ShowImageCart(
    path: '/assets/cards/energy_recovery.png',
  );
  CardUI cardUI = CardUI(
      cardType: 'Common',
      cardName: 'Energy Recovery',
      description: 'Regenerate self 5 energy',
      linkImage: '/assets/cards/energy_recovery.png');
  void cardEffect(Knight player) {
    player.barLifeController.increaseStamina(50);
  }
}
