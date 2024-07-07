class CollaborationModel{

  String? id;
  String? songId;
  Duration? duration;

  CollaborationModel({this.id,this.songId,this.duration});

  Map<String, dynamic> toJson() => {
    "id": id,
    "songId": songId,
    "duration": duration!.inMilliseconds
  };

  factory CollaborationModel.fromJson(Map<dynamic, dynamic> json) {
    return CollaborationModel(
      id: json['id'],
      songId: json['songId'],
      duration: Duration(milliseconds: json['duration']),
    );
  }

}