class MapRS {
  String? id;
  String? idClientHost;
  String? createDate;

  MapRS({this.id, this.idClientHost, this.createDate});

  MapRS.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idClientHost = json['idClientHost'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idClientHost'] = this.idClientHost;
    data['createDate'] = this.createDate;
    return data;
  }
}
