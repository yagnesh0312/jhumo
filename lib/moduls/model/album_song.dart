// To parse this JSON data, do
//
//     final albumSong = albumSongFromJson(jsonString);

import 'dart:convert';

import 'package:jhumo/moduls/model/service.dart';

AlbumSong albumSongFromJson(String str) => AlbumSong.fromJson(json.decode(str));

String albumSongToJson(AlbumSong data) => json.encode(data.toJson());

class AlbumSong {
    bool? success;
    Data? data;

    AlbumSong({
        this.success,
        this.data,
    });

    factory AlbumSong.fromJson(Map<String, dynamic> json) => AlbumSong(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    String? id;
    String? name;
    String? description;
    String? type;
    int? year;
    dynamic playCount;
    String? language;
    bool? explicitContent;
    String? url;
    int? songCount;
    Artists? artists;
    List<Image>? image;
    List<Result>? songs;

    Data({
        this.id,
        this.name,
        this.description,
        this.type,
        this.year,
        this.playCount,
        this.language,
        this.explicitContent,
        this.url,
        this.songCount,
        this.artists,
        this.image,
        this.songs,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        year: json["year"],
        playCount: json["playCount"],
        language: json["language"],
        explicitContent: json["explicitContent"],
        url: json["url"],
        songCount: json["songCount"],
        artists: json["artists"] == null ? null : Artists.fromJson(json["artists"]),
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        songs: json["songs"] == null ? [] : List<Result>.from(json["songs"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "year": year,
        "playCount": playCount,
        "language": language,
        "explicitContent": explicitContent,
        "url": url,
        "songCount": songCount,
        "artists": artists?.toJson(),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toJson())),
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
        primary: json["primary"] == null ? [] : List<All>.from(json["primary"]!.map((x) => All.fromJson(x))),
        featured: json["featured"] == null ? [] : List<All>.from(json["featured"]!.map((x) => All.fromJson(x))),
        all: json["all"] == null ? [] : List<All>.from(json["all"]!.map((x) => All.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "primary": primary == null ? [] : List<dynamic>.from(primary!.map((x) => x.toJson())),
        "featured": featured == null ? [] : List<dynamic>.from(featured!.map((x) => x.toJson())),
        "all": all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
    };
}

class All {
    String? id;
    String? name;
    String? role;
    List<Image>? image;
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
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "type": type,
        "url": url,
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
