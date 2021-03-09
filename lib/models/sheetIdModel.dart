class SheetKeyModel {
  String id;
  String key;
  String keyName;
  String selected;

  SheetKeyModel({this.id, this.key, this.keyName, this.selected});

  SheetKeyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    keyName = json['keyName'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['keyName'] = this.keyName;
    data['selected'] = this.selected;
    return data;
  }
}