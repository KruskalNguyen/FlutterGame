import 'package:bonfire/bonfire.dart';
import 'package:drainblood/Difinitions/interface/bar_life_controller.dart';
import 'package:drainblood/Difinitions/player/fireball_attack.dart';
import 'package:drainblood/Difinitions/player/player_dialog.dart';
import 'package:drainblood/Difinitions/server/connect/server_connect.dart';
import 'package:drainblood/Difinitions/util/common_sprite_sheet.dart';
import 'package:drainblood/Difinitions/util/player_sprite_sheet.dart';
import 'package:drainblood/Features/Home/presentation/views/home_page_route.dart';
import 'package:drainblood/Features/Mutiplayer/data/controller/mutiplayer_controller.dart';
import 'package:drainblood/Features/Mutiplayer/data/paras/player_move_para.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PlayerAttackType {
  attackMelee,
  attackRange,
}

class KnightOnline extends SimplePlayer
    with Lighting, BlockMovementCollision, FireballAttack {
  double attack = 100;
  bool canShowEmote = true;
  bool showedDialog = false;
  late BarLifeController barLifeController;
  final String idRoom;
  final String playerName;
  KnightOnline(Vector2 position, Vector2 size, this.idRoom, this.playerName)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          size: size,
          position: position,
          speed: size.x * 2,
          life: 200,
        ) {
    setupMovementByJoystick(intensityEnabled: true);
    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        color: Colors.transparent,
      ),
    );
  }

  @override
  Future<void> onMove(double speed, Vector2 displacement, Direction direction,
      double angle) async {
    super.onMove(speed, displacement, direction, angle);

    PlayerMovePara para = PlayerMovePara(
        direction: direction.name,
        idClient: ServerConnection.hubConnection.connectionId,
        positionX: position.x,
        positionY: position.y,
        idRoom: idRoom);
    ServerConnection.hubConnection.send('PlayerMove', args: [para.toJson()]);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _drawPlayerName(canvas);
  }

  void _drawPlayerName(Canvas canvas) {
    final TextPainter painter = TextPainter(
      text: TextSpan(
        text: playerName,
        style: TextStyle(color: Colors.white, fontSize: 5),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    painter.layout();
    painter.paint(canvas, Offset(position.x / 16 - 8, position.y / 16 - 16));
  }

  @override
  Future<void> idle() async {
    super.idle();
    PlayerMovePara para = PlayerMovePara(
        direction: animation!.currentType.toString().split('.')[1],
        idClient: ServerConnection.hubConnection.connectionId,
        positionX: position.x,
        positionY: position.y,
        idRoom: idRoom);
    ServerConnection.hubConnection.send('PlayerMove', args: [para.toJson()]);
  }

  @override
  void onJoystickChangeDirectional(JoystickDirectionalEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning) {
      return;
    }
    super.onJoystickChangeDirectional(event);
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning || isDead) {
      return;
    }
    if (event.event == ActionEvent.DOWN) {
      if (event.id == LogicalKeyboardKey.space ||
          event.id == PlayerAttackType.attackMelee) {
        if (barLifeController.stamina >= 15) {
          decrementStamina(15);
          execMeleeAttack(attack);
        }
      }
    }

    super.onJoystickAction(event);
  }

  @override
  void die() {
    barLifeController.life = 0.0;
    removeFromParent();
    gameRef.add(
      GameDecoration.withSprite(
        sprite: Sprite.load('player/crypt.png'),
        position: position,
        size: size,
      ),
    );
    super.die();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _checkViewEnemy(dt);
    _updateLifeAndStamina(dt);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    showDamage(
      damage,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.red,
      ),
    );
    super.receiveDamage(attacker, damage, identify);
  }

  void execShowEmote() {
    add(
      AnimatedGameObject(
        position: Vector2(width / 4, 0),
        animation: CommonSpriteSheet.emote,
        size: Vector2.all(width / 2),
        loop: false,
      ),
    );
  }

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }

  @override
  void onMount() {
    barLifeController = BarLifeController();
    barLifeController.configure(maxLife: maxLife, maxStamina: 100);
    super.onMount();
  }

  void decrementStamina(int i) {
    barLifeController.decrementStamina(i);
  }

  void _updateLifeAndStamina(double dt) {
    barLifeController.updateLife(life);
    if (barLifeController.stamina >= 100) {
      return;
    }
    if (checkInterval('INCREMENT_STAMINA', 100, dt)) {
      barLifeController.increaseStamina(2);
    }
  }

  void _checkViewEnemy(double dt) {
    if (checkInterval('seeEnemy', 250, dt)) {
      seeEnemy(
        radiusVision: width * 4,
        notObserved: () => canShowEmote = true,
        observed: (enemies) => {
          //_handleObserveEnemy(enemies.first)
        },
      );
    }
  }

  void _handleObserveEnemy(Enemy enemy) {
    if (canShowEmote) {
      canShowEmote = false;
      execShowEmote();
    }
    if (!showedDialog) {
      showedDialog = true;
      double lastZoom = gameRef.camera.zoom;
      stopMove();
      PlayerDialog.execShowTalk(
        gameRef,
        enemy,
        () {
          if (!isDead) {
            gameRef.camera.moveToPlayerAnimated(
              effectController: EffectController(duration: 1),
              zoom: lastZoom,
            );
          }
        },
      );
    }
  }

  void execMeleeAttack(double attack) {
    simpleAttackMelee(
      damage: attack,
      animationRight: CommonSpriteSheet.whiteAttackEffectRight,
      size: size,
    );
  }
}
