import 'package:drainblood/Features/Mutiplayer/data/paras/player_para.dart';

class JoinRoomPara {
  String? idRoom;
  PlayerPara? player;

  JoinRoomPara({this.idRoom, this.player});

  JoinRoomPara.fromJson(Map<String, dynamic> json) {
    idRoom = json['idRoom'];
    player =
        json['player'] != null ? new PlayerPara.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idRoom'] = this.idRoom;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}
