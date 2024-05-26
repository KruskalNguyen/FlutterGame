class PlayerMovePara {
  String? idRoom;
  String? idClient;
  double? positionX;
  double? positionY;
  String? direction;

  PlayerMovePara(
      {this.idRoom,
      this.idClient,
      this.positionX,
      this.positionY,
      this.direction});

  PlayerMovePara.fromJson(Map<String, dynamic> json) {
    idRoom = json['idRoom'];
    idClient = json['idClient'];
    positionX = json['positionX'];
    positionY = json['positionY'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idRoom'] = this.idRoom;
    data['idClient'] = this.idClient;
    data['positionX'] = this.positionX;
    data['positionY'] = this.positionY;
    data['direction'] = this.direction;
    return data;
  }
}
