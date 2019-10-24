
class Note {
  String image;
  String name;
  bool selected;

  Note({this.image, this.name , this.selected});

  Note.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    selected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}