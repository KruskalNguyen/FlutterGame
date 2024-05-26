import 'package:drainblood/Difinitions/server/connect/server_connect.dart';
import 'package:drainblood/Features/Home/presentation/views/home_page_route.dart';
import 'package:drainblood/Features/Login/presentation/View/login_page_route.dart';
import 'package:drainblood/Features/Mutiplayer/data/controller/mutiplayer_controller.dart';
import 'package:drainblood/Features/Mutiplayer/data/paras/join_room_para.dart';
import 'package:drainblood/Features/Mutiplayer/data/paras/player_para.dart';
import 'package:drainblood/Features/Mutiplayer/data/respones/map_rs.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/view/lobby/muti_player_page.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/view/lobby/muti_player_route.dart';
import 'package:flutter/material.dart';

class JoinOrCreate extends StatelessWidget {
  const JoinOrCreate({super.key});
  @override
  Widget build(BuildContext context) {
    final idRoomcontroll = TextEditingController();

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  await ServerConnection.start();
                  PlayerPara para = PlayerPara(
                      positionX: 16.1 * 7.1,
                      positionY: 16.1 * 7.1,
                      direction: 'idle',
                      email: HomePageRoute.displayName,
                      idClient: ServerConnection.hubConnection.connectionId);
                  var rs = await MuitiplayerController.CreateRoom(para);
                  MapRS? data = MapRS.fromJson(rs.data);
                  Navigator.pushReplacementNamed(
                      context, MutiPlayerRoute.routeName,
                      arguments: data);
                });
              },
              child: Text('Tạo phòng'),
            ),
            TextField(
              controller: idRoomcontroll,
            ),
            InkWell(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  await ServerConnection.start();
                  PlayerPara paraPlayer = PlayerPara(
                      positionX: 16.1 * 7.1,
                      positionY: 16.1 * 7.1,
                      direction: 'idle',
                      email: HomePageRoute.displayName,
                      idClient: ServerConnection.hubConnection.connectionId);
                  JoinRoomPara paraJoin = JoinRoomPara(
                      idRoom: idRoomcontroll.text, player: paraPlayer);
                  var rs = await MuitiplayerController.JoinRoom(paraJoin);
                  MutiPlayerPage.IdRoom = idRoomcontroll.text;
                  Navigator.pushReplacementNamed(
                      context, MutiPlayerRoute.routeName,
                      arguments: rs.data);
                });
              },
              child: Text('Tham gia phòng'),
            ),
          ],
        ),
      ),
    );
  }
}
