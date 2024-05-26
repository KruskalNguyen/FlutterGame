import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/enemy/goblin.dart';
import 'package:drainblood/Difinitions/interface/knight_interface.dart';
import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IslandMap extends StatelessWidget {
  const IslandMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    Vector2 vecSize = Vector2(tileSize, tileSize);

    return LayoutBuilder(builder: (context, constraints) {
      return BonfireWidget(
        showCollisionArea: false,
        joystick: Joystick(
          directional: JoystickDirectional(
            spriteBackgroundDirectional: Sprite.load(
              'joystick_background.png',
            ),
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
              spriteBackgroundDirection: Sprite.load(
                'joystick_background.png',
              ),
              enableDirection: true,
              size: 50,
              margin: const EdgeInsets.only(bottom: 50, right: 160),
            )
          ],
        ),
        map: WorldMapByTiled(
          TiledReader.asset('tiled/island.json'),
          objectsBuilder: {
            'goblin': (properties) => Goblin(properties.position, vecSize)
          },
          forceTileSize: Vector2(tileSize, tileSize),
        ),
        player: Knight(Vector2(tileSize * 30, tileSize * 20), Vector2(16, 16)),
        cameraConfig: CameraConfig(
          zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
          initPosition: Vector2(tileSize * 30, tileSize * 20),
        ),
        overlayBuilderMap: {
          //'barLife': (context, game) => const BarLifeWidget(),
          'miniMap': (context, game) => MiniMap(
                zoom: 2,
                game: game,
                margin: const EdgeInsets.all(20),
                borderRadius: BorderRadius.circular(10),
                size: Vector2.all(
                  min(constraints.maxHeight, constraints.maxWidth) / 3,
                ),
                border: Border.all(color: Colors.white.withOpacity(0.5)),
              ),
        },
        initialActiveOverlays: const [
          //'barLife',
          'miniMap',
        ],
        lightingColorGame: Colors.black.withOpacity(0),
        interface: KnightInterface(),
      );
    });
  }
}

Future<String> loadJsonFromAsset(String path) async {
  return await rootBundle.loadString(path);
}
