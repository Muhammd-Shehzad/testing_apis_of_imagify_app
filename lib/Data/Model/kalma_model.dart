class KalmaModel {
  int? id;
  int? chapterId;
  String? name;
  String? urduName;
  String? desc;
  String? urduDesc;
  String? path;
  String? thumbnail;
  Null? wspath;
  String? version;
  Status? status;
  String? datecreated;
  String? thumbnailUrl;

  KalmaModel({
    this.id,
    this.chapterId,
    this.name,
    this.urduName,
    this.desc,
    this.urduDesc,
    this.path,
    this.thumbnail,
    this.wspath,
    this.version,
    this.status,
    this.datecreated,
    this.thumbnailUrl,
  });

  KalmaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapter_id'];
    name = json['name'];
    urduName = json['urdu_name'];
    desc = json['desc'];
    urduDesc = json['urdu_desc'];
    path = json['path'];
    thumbnail = json['thumbnail'];
    wspath = json['wspath'];
    version = json['version'];
    status = json['status'] != null
        ? new Status.fromJson(json['status'])
        : null;
    datecreated = json['datecreated'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapter_id'] = this.chapterId;
    data['name'] = this.name;
    data['urdu_name'] = this.urduName;
    data['desc'] = this.desc;
    data['urdu_desc'] = this.urduDesc;
    data['path'] = this.path;
    data['thumbnail'] = this.thumbnail;
    data['wspath'] = this.wspath;
    data['version'] = this.version;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['datecreated'] = this.datecreated;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

class Status {
  String? type;
  List<int>? data;

  Status({this.type, this.data});

  Status.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['data'] = this.data;
    return data;
  }
}
