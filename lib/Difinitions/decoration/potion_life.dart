import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/map/manual_map/dungeon_map.dart';
import 'package:drainblood/Difinitions/util/common_sprite_sheet.dart';

class PotionLife extends GameDecoration with Sensor<Player>, Movement {
  final double life;

  PotionLife(Vector2 position, this.life, {Vector2? size})
      : super.withSprite(
          sprite: CommonSpriteSheet.potionLifeSprite,
          position: position,
          size: size ?? Vector2.all(DungeonMap.tileSize * 0.5),
        );

  @override
  void onContact(Player component) {
    component.addLife(10);
    removeFromParent();
    super.onContact(component);
  }

  @override
  void onMount() {
    gameRef.generateValues(
      const Duration(seconds: 1),
      onChange: (value) {
        spriteOffset = Vector2(0, 5 * -value);
      },
      infinite: true,
    );
    super.onMount();
  }
}
