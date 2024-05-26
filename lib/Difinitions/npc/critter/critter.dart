import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/map/manual_map/dungeon_map.dart';
import 'package:drainblood/Difinitions/util/critter_sprite_sheet.dart';
import 'package:flutter/material.dart';

class Critter extends SimpleNpc
    with BlockMovementCollision, AutomaticRandomMovement {
  bool enableBehaviors = true;
  Critter(Vector2 position)
      : super(
          animation: CritterSpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2.all(DungeonMap.tileSize * 0.8),
          speed: DungeonMap.tileSize,
        );

  @override
  void update(double dt) {
    if (!enableBehaviors) return;

    seeAndMoveToPlayer(
      closePlayer: (player) {
        gameRef.lighting?.color = Colors.black.withOpacity(0.6);
        if (gameRef.player!.life < 200)
          gameRef.player?.updateLife((gameRef.player!.life + 0.5));
      },
      observed: () {},
      radiusVision: DungeonMap.tileSize * 1.5,
      notObserved: () {
        gameRef.lighting?.color = Colors.black.withOpacity(0.75);
        runRandomMovement(
          dt,
          speed: speed / 10,
          maxDistance: (DungeonMap.tileSize).toInt(),
        );
        return false;
      },
    );
    super.update(dt);
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(
          DungeonMap.tileSize * 0.4,
          DungeonMap.tileSize * 0.4,
        ),
        position: Vector2(
          DungeonMap.tileSize * 0.2,
          DungeonMap.tileSize * 0.2,
        ),
      ),
    );
    return super.onLoad();
  }
}
