class KalmaModel {
  int? id;
  int? chapterId;
  String? name;
  String? urduName;
  String? desc;
  String? urduDesc;
  String? path;
  String? thumbnail;
  Null wspath;
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
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    datecreated = json['datecreated'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chapter_id'] = chapterId;
    data['name'] = name;
    data['urdu_name'] = urduName;
    data['desc'] = desc;
    data['urdu_desc'] = urduDesc;
    data['path'] = path;
    data['thumbnail'] = thumbnail;
    data['wspath'] = wspath;
    data['version'] = version;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['datecreated'] = datecreated;
    data['thumbnailUrl'] = thumbnailUrl;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['data'] = this.data;
    return data;
  }
}
