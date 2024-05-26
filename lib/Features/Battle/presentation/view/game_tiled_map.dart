import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/cards/CardEffect/AttackBoost.dart';
import 'package:drainblood/Difinitions/cards/CardEffect/EnergyRecovery.dart';
import 'package:drainblood/Difinitions/cards/CardEffect/HealthBoost.dart';
import 'package:drainblood/Difinitions/cards/CardEffect/RangeBoost.dart';
import 'package:drainblood/Difinitions/cards/CardEffect/SpeedBoost.dart';
import 'package:drainblood/Difinitions/decoration/barrel_dragable.dart';
import 'package:drainblood/Difinitions/decoration/chest.dart';
import 'package:drainblood/Difinitions/decoration/column.dart';
import 'package:drainblood/Difinitions/decoration/spikes.dart';
import 'package:drainblood/Difinitions/decoration/torch.dart';
import 'package:drainblood/Difinitions/enemy/goblin.dart';
import 'package:drainblood/Difinitions/interface/bar_life_widget.dart';
import 'package:drainblood/Difinitions/interface/knight_interface.dart';
import 'package:drainblood/Difinitions/map/manual_map/dungeon_map.dart';
import 'package:drainblood/Difinitions/npc/critter/critter.dart';
import 'package:drainblood/Difinitions/npc/wizard/wizard.dart';
import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:drainblood/Features/Battle/presentation/view/simple_player_route.dart';
import 'package:drainblood/Features/Battle/presentation/widget/show_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameTiledMap extends StatefulWidget {
  final int map;

  const GameTiledMap({Key? key, this.map = 1}) : super(key: key);

  @override
  State<GameTiledMap> createState() => _GameTiledMapState();
}

class _GameTiledMapState extends State<GameTiledMap> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BonfireWidget(
          keyboardConfig: KeyboardConfig(
            directionalKeys: KeyboardDirectionalKeys.arrows(),
            acceptedKeys: [
              LogicalKeyboardKey.space,
            ],
          ),
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
          player: Knight(
              Vector2((8 * DungeonMap.tileSize), (5 * DungeonMap.tileSize)),
              Vector2(DungeonMap.tileSize, DungeonMap.tileSize)),
          interface: KnightInterface(),
          map: WorldMapByTiled(
            TiledReader.asset('tiled/mapa${widget.map}.json'),
            forceTileSize: Vector2(DungeonMap.tileSize, DungeonMap.tileSize),
            objectsBuilder: {
              'goblin': (properties) => Goblin(properties.position,
                  Vector2(DungeonMap.tileSize, DungeonMap.tileSize)),
              'torch': (properties) => Torch(properties.position),
              'barrel': (properties) => BarrelDraggable(properties.position),
              'spike': (properties) => Spikes(properties.position),
              'column': (properties) => ColumnDecoration(properties.position),
              'chest': (properties) => Chest(properties.position),
              'critter': (properties) => Critter(properties.position),
              'wizard': (properties) =>
                  Wizard(properties.position, SimplePlayerRoute.routeName),
            },
          ),
          lightingColorGame: Colors.black.withOpacity(0.7),
          overlayBuilderMap: {
            'miniMap': (context, game) => MiniMap(
                  game: game,
                  margin: const EdgeInsets.all(20),
                  borderRadius: BorderRadius.circular(10),
                  size: Vector2.all(
                    min(constraints.maxHeight, constraints.maxWidth) / 3,
                  ),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
          },
          initialActiveOverlays: const ['miniMap'],
          cameraConfig: CameraConfig(
            zoom: getZoomFromMaxVisibleTile(context, DungeonMap.tileSize, 20),
          ),
        );
      },
    );
  }
}
