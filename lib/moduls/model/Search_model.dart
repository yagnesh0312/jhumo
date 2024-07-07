// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

import 'package:jhumo/moduls/model/service.dart';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  bool? success;
  Data? data;

  SearchModel({
    this.success,
    this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  Songs? topQuery;
  Songs? songs;
  Albums? albums;
  Artists? artists;
  Playlists? playlists;

  Data({
    this.topQuery,
    this.songs,
    this.albums,
    this.artists,
    this.playlists,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        topQuery:
            json["topQuery"] == null ? null : Songs.fromJson(json["topQuery"]),
        songs: json["songs"] == null ? null : Songs.fromJson(json["songs"]),
        albums: json["albums"] == null ? null : Albums.fromJson(json["albums"]),
        artists:
            json["artists"] == null ? null : Artists.fromJson(json["artists"]),
        playlists: json["playlists"] == null
            ? null
            : Playlists.fromJson(json["playlists"]),
      );

  Map<String, dynamic> toJson() => {
        "topQuery": topQuery?.toJson(),
        "songs": songs?.toJson(),
        "albums": albums?.toJson(),
        "artists": artists?.toJson(),
        "playlists": playlists?.toJson(),
      };
}

class Albums {
  List<Result>? results;
  int? position;

  Albums({
    this.results,
    this.position,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "position": position,
      };
}


class Image {
  String? quality;
  String? url;

  Image({
    this.quality,
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        quality: json["quality"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "quality": quality,
        "url": url,
      };
}

class Artists {
  List<Result>? results;
  int? position;

  Artists({
    this.results,
    this.position,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "position": position,
      };
}

class Playlists {
  List<Result>? results;
  int? position;

  Playlists({
    this.results,
    this.position,
  });

  factory Playlists.fromJson(Map<String, dynamic> json) => Playlists(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "position": position,
      };
}

class Songs {
  List<SongsResult>? results;
  int? position;

  Songs({
    this.results,
    this.position,
  });

  factory Songs.fromJson(Map<String, dynamic> json) => Songs(
        results: json["results"] == null
            ? []
            : List<SongsResult>.from(
                json["results"]!.map((x) => SongsResult.fromJson(x))),
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "position": position,
      };
}

class SongsResult {
  String? id;
  String? title;
  List<Image>? image;
  String? album;
  String? url;
  String? type;
  String? language;
  String? description;
  String? primaryArtists;
  String? singers;

  SongsResult({
    this.id,
    this.title,
    this.image,
    this.album,
    this.url,
    this.type,
    this.language,
    this.description,
    this.primaryArtists,
    this.singers,
  });

  factory SongsResult.fromJson(Map<String, dynamic> json) => SongsResult(
        id: json["id"],
        title: json["title"],
        image: json["image"] == null
            ? []
            : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        album: json["album"],
        url: json["url"],
        type: json["type"],
        language: json["language"],
        description: json["description"],
        primaryArtists: json["primaryArtists"],
        singers: json["singers"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image == null
            ? []
            : List<dynamic>.from(image!.map((x) => x.toJson())),
        "album": album,
        "url": url,
        "type": type,
        "language": language,
        "description": description,
        "primaryArtists": primaryArtists,
        "singers": singers,
      };
}
// --------------------------------------------------------Artist
