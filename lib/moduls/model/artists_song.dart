// To parse this JSON data, do
//
//     final artistGetData = artistGetDataFromJson(jsonString);

import 'dart:convert';

import 'package:jhumo/moduls/model/service.dart';

ArtistGetData artistGetDataFromJson(String str) =>
    ArtistGetData.fromJson(json.decode(str));

String artistGetDataToJson(ArtistGetData data) => json.encode(data.toJson());

class ArtistGetData {
  bool? success;
  Data? data;

  ArtistGetData({
    this.success,
    this.data,
  });

  factory ArtistGetData.fromJson(Map<String, dynamic> json) => ArtistGetData(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  int? total;
  List<Result>? songs;

  Data({
    this.total,
    this.songs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        songs: json["songs"] == null
            ? []
            : List<Result>.from(json["songs"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "songs": songs == null
            ? []
            : List<dynamic>.from(songs!.map((x) => x.toJson())),
      };
}

class Song {
  String? id;
  String? name;
  String? type;
  String? year;
  dynamic releaseDate;
  int? duration;
  String? label;
  bool? explicitContent;
  dynamic playCount;
  String? language;
  bool? hasLyrics;
  dynamic lyricsId;
  String? url;
  String? copyright;
  Album? album;
  Artists? artists;
  List<DownloadUrl>? image;
  List<DownloadUrl>? downloadUrl;

  Song({
    this.id,
    this.name,
    this.type,
    this.year,
    this.releaseDate,
    this.duration,
    this.label,
    this.explicitContent,
    this.playCount,
    this.language,
    this.hasLyrics,
    this.lyricsId,
    this.url,
    this.copyright,
    this.album,
    this.artists,
    this.image,
    this.downloadUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        year: json["year"],
        releaseDate: json["releaseDate"],
        duration: json["duration"],
        label: json["label"],
        explicitContent: json["explicitContent"],
        playCount: json["playCount"],
        language: json["language"],
        hasLyrics: json["hasLyrics"],
        lyricsId: json["lyricsId"],
        url: json["url"],
        copyright: json["copyright"],
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists:
            json["artists"] == null ? null : Artists.fromJson(json["artists"]),
        image: json["image"] == null
            ? []
            : List<DownloadUrl>.from(
                json["image"]!.map((x) => DownloadUrl.fromJson(x))),
        downloadUrl: json["downloadUrl"] == null
            ? []
            : List<DownloadUrl>.from(
                json["downloadUrl"]!.map((x) => DownloadUrl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "year": year,
        "releaseDate": releaseDate,
        "duration": duration,
        "label": label,
        "explicitContent": explicitContent,
        "playCount": playCount,
        "language": language,
        "hasLyrics": hasLyrics,
        "lyricsId": lyricsId,
        "url": url,
        "copyright": copyright,
        "album": album?.toJson(),
        "artists": artists?.toJson(),
        "image": image == null
            ? []
            : List<dynamic>.from(image!.map((x) => x.toJson())),
        "downloadUrl": downloadUrl == null
            ? []
            : List<dynamic>.from(downloadUrl!.map((x) => x.toJson())),
      };
}

class Album {
  String? id;
  String? name;
  String? url;

  Album({
    this.id,
    this.name,
    this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class Artists {
  List<All>? primary;
  List<All>? featured;
  List<All>? all;

  Artists({
    this.primary,
    this.featured,
    this.all,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        primary: json["primary"] == null
            ? []
            : List<All>.from(json["primary"]!.map((x) => All.fromJson(x))),
        featured: json["featured"] == null
            ? []
            : List<All>.from(json["featured"]!.map((x) => All.fromJson(x))),
        all: json["all"] == null
            ? []
            : List<All>.from(json["all"]!.map((x) => All.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "primary": primary == null
            ? []
            : List<dynamic>.from(primary!.map((x) => x.toJson())),
        "featured": featured == null
            ? []
            : List<dynamic>.from(featured!.map((x) => x.toJson())),
        "all":
            all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
      };
}

class All {
  String? id;
  String? name;
  String? role;
  List<DownloadUrl>? image;
  String? type;
  String? url;

  All({
    this.id,
    this.name,
    this.role,
    this.image,
    this.type,
    this.url,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        image: json["image"] == null
            ? []
            : List<DownloadUrl>.from(
                json["image"]!.map((x) => DownloadUrl.fromJson(x))),
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "image": image == null
            ? []
            : List<dynamic>.from(image!.map((x) => x.toJson())),
        "type": type,
        "url": url,
      };
}

class DownloadUrl {
  String? quality;
  String? url;

  DownloadUrl({
    this.quality,
    this.url,
  });

  factory DownloadUrl.fromJson(Map<String, dynamic> json) => DownloadUrl(
        quality: json["quality"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "quality": quality,
        "url": url,
      };
}
