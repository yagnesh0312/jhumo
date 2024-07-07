// To parse this JSON data, do
//
//     final lyrics = lyricsFromJson(jsonString);

import 'dart:convert';

Lyrics lyricsFromJson(String str) => Lyrics.fromJson(json.decode(str));

String lyricsToJson(Lyrics data) => json.encode(data.toJson());

class Lyrics {
  bool? success;
  Data? data;

  Lyrics({
    this.success,
    this.data,
  });

  factory Lyrics.fromJson(Map<String, dynamic> json) => Lyrics(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  String? lyrics;
  String? snippet;
  String? copyright;

  Data({
    this.lyrics,
    this.snippet,
    this.copyright,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lyrics: json["lyrics"],
        snippet: json["snippet"],
        copyright: json["copyright"],
      );

  Map<String, dynamic> toJson() => {
        "lyrics": lyrics,
        "snippet": snippet,
        "copyright": copyright,
      };
}
