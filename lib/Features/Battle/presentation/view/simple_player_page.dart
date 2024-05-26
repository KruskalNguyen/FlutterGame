import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/interface/knight_interface.dart';
import 'package:drainblood/Difinitions/map/manual_map/dungeon_map.dart';
import 'package:drainblood/Difinitions/map/manual_map/game_manual_controller.dart';
import 'package:drainblood/Difinitions/npc/wizard/wizard.dart';
import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:drainblood/Features/Battle/presentation/view/island_map/island_map_route.dart';
import 'package:flutter/material.dart';

class SimplePlayerPage extends StatelessWidget {
  const SimplePlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: DungeonMap.map(),
      player: Knight(
          Vector2((8 * DungeonMap.tileSize), (5 * DungeonMap.tileSize)),
          Vector2(DungeonMap.tileSize, DungeonMap.tileSize)),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, DungeonMap.tileSize, 10),
      ),
      backgroundColor: Colors.blueGrey[900]!,
      lightingColorGame: Colors.black.withOpacity(0.75),
      joystick: Joystick(
        directional: JoystickDirectional(
          spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
          spriteKnobDirectional: Sprite.load('joystick_knob.png'),
          size: 100,
          isFixed: true,
        ),
        actions: [
          JoystickAction(
            actionId: PlayerAttackType.attackMelee,
            sprite: Sprite.load('joystick_attack.png'),
            align: JoystickActionAlign.BOTTOM_RIGHT,
            size: 80,
            margin: const EdgeInsets.only(bottom: 50, right: 50),
          ),
          JoystickAction(
            actionId: PlayerAttackType.attackRange,
            sprite: Sprite.load('joystick_attack_range.png'),
            spriteBackgroundDirection: Sprite.load('joystick_background.png'),
            size: 50,
            enableDirection: true,
            margin: const EdgeInsets.only(bottom: 50, right: 160),
          )
        ],
      ),
      interface: KnightInterface(),
      components: [
        ...DungeonMap.enemies(),
        ...DungeonMap.decorations(),
        GameManualController(),
        Wizard(Vector2((10 * DungeonMap.tileSize), (5 * DungeonMap.tileSize)),
            IslandMapRoute.routeName)
      ],
    );
  }
}
