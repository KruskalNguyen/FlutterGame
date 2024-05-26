import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/map/manual_map/dungeon_map.dart';
import 'package:drainblood/Difinitions/util/common_sprite_sheet.dart';
import 'package:flutter/material.dart';

class Torch extends GameDecoration {
  Torch(Vector2 position)
      : super.withAnimation(
          animation: CommonSpriteSheet.torchAnimated,
          size: Vector2.all(DungeonMap.tileSize),
          position: position,
          lightingConfig: LightingConfig(
            radius: DungeonMap.tileSize * 2,
            blurBorder: DungeonMap.tileSize,
            color: Colors.deepOrangeAccent.withOpacity(0.3),
            withPulse: true,
            align: Vector2(
                -DungeonMap.tileSize * 0.25, -DungeonMap.tileSize * 0.3),
          ),
        );
}
