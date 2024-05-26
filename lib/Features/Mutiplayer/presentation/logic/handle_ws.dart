import 'dart:convert';

import 'package:bonfire/base/bonfire_game_interface.dart';
import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/player/knight_online.dart';
import 'package:drainblood/Features/Mutiplayer/data/respones/player_ws_rs.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/view/lobby/muti_player_page.dart';

class HandleWs {
  static void JoinRoom(
      Map<String?, KnightOnline> players, BonfireGameInterface gameRef) {
    if (MutiPlayerInter.argsJoinMap != null) {
      String jsonStr = jsonEncode(MutiPlayerInter.argsJoinMap![0]);
      Map<String, dynamic> myMap = jsonDecode(jsonStr);
      var player = PlayerWSRS.fromJson(myMap);
      if (!players.containsKey(player.idClient)) {
        players[player.idClient] = KnightOnline(Vector2(16 * 7, 16 * 6),
            Vector2.all(16), MutiPlayerPage.IdRoom, player.email!);
        gameRef.add(players[player.idClient]!);
        MutiPlayerInter.argsJoinMap = null;
      }
    }
  }

  static void PlayerMove(
      Map<String?, KnightOnline> players, BonfireGameInterface gameRef) {
    if (MutiPlayerInter.argsPlayerMove != null) {
      String jsonStr = jsonEncode(MutiPlayerInter.argsPlayerMove![0]);
      Map<String, dynamic> data = jsonDecode(jsonStr);
      var player = PlayerWSRS.fromJson(data);

      if (players.containsKey(player.idClient)) {
        players[player.idClient]?.position =
            Vector2(player.positionX!, player.positionY!);
        if (player.direction!.contains('idle'))
          players[player.idClient]?.onPlayIdleUpAnimation();
        else
          players[player.idClient]?.onPlayRunUpAnimation();
      }
      MutiPlayerInter.argsPlayerMove = null;
    }
  }

  static void GetPlayers(
      Map<String?, KnightOnline> players, BonfireGameInterface gameRef) {
    if (MutiPlayerInter.argsGetPlayer != null) {
      Map data = MutiPlayerInter.argsGetPlayer![0] as Map;
      for (var item in data.values) {
        String jsonStr = jsonEncode(item);
        Map<String, dynamic> myMap = jsonDecode(jsonStr);
        var player = PlayerWSRS.fromJson(myMap);
        if (!players.containsKey(player.idClient)) {
          players[player.idClient] = KnightOnline(
              Vector2(player.positionX!, player.positionY!),
              Vector2.all(16),
              MutiPlayerPage.IdRoom,
              player.email!);
          gameRef.add(players[player.idClient]!);
          MutiPlayerInter.argsJoinMap = null;
        }
      }
      MutiPlayerInter.argsGetPlayer = null;
    }
  }
}
