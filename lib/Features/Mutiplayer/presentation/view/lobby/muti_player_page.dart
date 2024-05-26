import 'dart:convert';

import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/player/knight.dart';
import 'package:drainblood/Difinitions/player/knight_online.dart';
import 'package:drainblood/Difinitions/server/connect/server_connect.dart';
import 'package:drainblood/Features/Home/presentation/views/home_page_route.dart';
import 'package:drainblood/Features/Mutiplayer/data/controller/mutiplayer_controller.dart';
import 'package:drainblood/Features/Mutiplayer/data/paras/player_para.dart';
import 'package:drainblood/Features/Mutiplayer/data/respones/map_rs.dart';
import 'package:drainblood/Features/Mutiplayer/data/respones/player_ws_rs.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/logic/handle_ws.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MutiPlayerPage extends StatefulWidget {
  static String IdRoom = '';
  MutiPlayerPage({Key? key}) : super(key: key);
  @override
  State<MutiPlayerPage> createState() => _MutiPlayerPageState();
}

class _MutiPlayerPageState extends State<MutiPlayerPage> {
  bool isRoomMaster = false;
  @override
  void dispose() {
    super.dispose();
    MuitiplayerController.DisposeRoom(MutiPlayerPage.IdRoom);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _disposeAsync();
    });
  }

  void _disposeAsync() async {
    await ServerConnection.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    const tileSize = 16.0;

    if (args is MapRS) {
      MutiPlayerPage.IdRoom = args.id!;
      isRoomMaster = true;
    }
    return BonfireWidget(
      map: WorldMapByTiled(
        TiledReader.asset('tiled/punnyworld/simple_map.tmj'),
      ),
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      player: KnightOnline(
          Vector2(tileSize * 7, tileSize * 6),
          Vector2.all(tileSize),
          MutiPlayerPage.IdRoom,
          HomePageRoute.displayName),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
      ),
      backgroundColor: const Color(0xff20a0b4),
      overlayBuilderMap: {
        'Map code': (context, game) => Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
              child: Text(
                'Mã phòng: ${MutiPlayerPage.IdRoom}',
                style: TextStyle(
                  fontSize: tileSize * 1.5,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
      },
      initialActiveOverlays: ['Map code'],
      interface: MutiPlayerInter(),
    );
  }
}

class MutiPlayerInter extends GameInterface {
  static List<Object?>? argsJoinMap;
  static List<Object?>? argsPlayerMove;
  static List<Object?>? argsGetPlayer;
  Map<String?, KnightOnline> players = Map<String, KnightOnline>();

  @override
  Future<void> render(Canvas canvas) async {
    HandleWs.JoinRoom(players, gameRef);
    HandleWs.PlayerMove(players, gameRef);
    HandleWs.GetPlayers(players, gameRef);
    super.render(canvas);
  }
}
