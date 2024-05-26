import 'package:drainblood/Difinitions/interface/bar_life_controller.dart';
import 'package:flutter/material.dart';

///
/// Created by
///
/// ─▄▀─▄▀
/// ──▀──▀
/// █▀▀▀▀▀█▄
/// █░░░░░█─█
/// ▀▄▄▄▄▄▀▀
///
/// Rafaelbarbosatec
/// on 04/03/22
class BarLifeWidget extends StatelessWidget {
  BarLifeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BarLifeController();
    return Material(
      type: MaterialType.transparency,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 48, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      controller.life.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Text(
                      ' / ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      controller.maxLife.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      controller.stamina.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Text(
                      ' / ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      controller.maxStamina.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
