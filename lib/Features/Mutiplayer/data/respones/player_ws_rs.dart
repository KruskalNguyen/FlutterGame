class PlayerWSRS {
  double? positionX;
  double? positionY;
  String? direction;
  String? email;
  String? idClient;

  PlayerWSRS(
      {this.positionX,
      this.positionY,
      this.direction,
      this.email,
      this.idClient});

  PlayerWSRS.fromJson(Map<String, dynamic> json) {
    positionX = json['positionX'].toDouble();
    positionY = json['positionY'].toDouble();
    direction = json['direction'];
    email = json['email'];
    idClient = json['idClient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['positionX'] = this.positionX;
    data['positionY'] = this.positionY;
    data['direction'] = this.direction;
    data['email'] = this.email;
    data['idClient'] = this.idClient;
    return data;
  }
}
