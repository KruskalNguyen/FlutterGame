import 'package:drainblood/Difinitions/server/path/server_path.dart';
import 'package:drainblood/Features/Mutiplayer/data/controller/mutiplayer_controller.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/view/lobby/muti_player_page.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/msgpack_hub_protocol.dart';

class ServerConnection {
  static HubConnection hubConnection =
      HubConnectionBuilder().withUrl(ServerPath.pathWss).build();

  static Future<void> start() async {
    await hubConnection.start();
    await hubConnection.send('negotiate', args: [
      {"protocol": "json", "version": 1}
    ]);
    hubConnection.on('IdClient', (List<Object?>? args) {
      print('test: ${args}');
    });
    hubConnection.on('PlayerJoin', (List<Object?>? args) {
      MutiPlayerInter.argsJoinMap = args;
    });
    hubConnection.on('GetPlayer', (List<Object?>? args) {
      MutiPlayerInter.argsGetPlayer = args;
    });
    hubConnection.on('PlayerMove', (List<Object?>? args) {
      MutiPlayerInter.argsPlayerMove = args;
    });
    hubConnection.on('DisposeRoom', (List<Object?>? args) {
      print('DisposeRoom');
    });
  }

  static Future<void> dispose() async {
    await hubConnection.stop();
  }
}
