import 'package:dio/dio.dart';
import 'package:drainblood/Difinitions/server/path/server_path.dart';
import 'package:drainblood/Features/Mutiplayer/data/paras/join_room_para.dart';
import 'package:drainblood/Features/Mutiplayer/data/paras/player_move_para.dart';
import 'package:drainblood/Features/Mutiplayer/data/paras/player_para.dart';

class MuitiplayerController {
  static String apiCreateRoom = '${ServerPath.pathRest}/api/Room/CreateRoom';
  static String apiJoinRoom = '${ServerPath.pathRest}/api/Room/JoinRoom';
  static String apiDisposeRoom = '${ServerPath.pathRest}/api/Room/DisposeRoom';
  static String apiPlayerMove = '${ServerPath.pathRest}/api/Room/PlayerMove';

  static Future<Response<dynamic>> CreateRoom(PlayerPara para) async {
    final rs = await Dio().post(apiCreateRoom, data: para.toJson());
    return rs;
  }

  static Future<Response<dynamic>> JoinRoom(JoinRoomPara para) async {
    final rs = await Dio().post(apiJoinRoom, data: para.toJson());
    return rs;
  }

  static Future<Response<dynamic>> DisposeRoom(String idRoom) async {
    final rs = await Dio().post('${apiDisposeRoom}?idRoom=${idRoom}');
    return rs;
  }
}
