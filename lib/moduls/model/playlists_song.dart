// To parse this JSON data, do
//
//     final playlistsSong = playlistsSongFromJson(jsonString);

import 'dart:convert';

import 'package:jhumo/moduls/model/service.dart';

PlaylistsSong playlistsSongFromJson(String str) => PlaylistsSong.fromJson(json.decode(str));

String playlistsSongToJson(PlaylistsSong data) => json.encode(data.toJson());

class PlaylistsSong {
    bool? success;
    Data? data;

    PlaylistsSong({
        this.success,
        this.data,
    });

    factory PlaylistsSong.fromJson(Map<String, dynamic> json) => PlaylistsSong(
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
    dynamic year;
    dynamic playCount;
    String? language;
    bool? explicitContent;
    String? url;
    int? songCount;
    List<Artist>? artists;
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
        artists: json["artists"] == null ? [] : List<Artist>.from(json["artists"]!.map((x) => Artist.fromJson(x))),
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
        "artists": artists == null ? [] : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "songs": songs == null ? [] : List<dynamic>.from(songs!.map((x) => x.toJson())),
    };
}

class Artist {
    String? id;
    String? name;
    String? role;
    List<Image>? image;
    String? type;
    String? url;

    Artist({
        this.id,
        this.name,
        this.role,
        this.image,
        this.type,
        this.url,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
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

class Song {
    String? id;
    String? name;
    String? type;
    String? year;
    DateTime? releaseDate;
    int? duration;
    String? label;
    bool? explicitContent;
    int? playCount;
    String? language;
    bool? hasLyrics;
    dynamic lyricsId;
    String? url;
    String? copyright;
    Album? album;
    Artists? artists;
    List<Image>? image;
    List<Image>? downloadUrl;

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
        releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
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
        artists: json["artists"] == null ? null : Artists.fromJson(json["artists"]),
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        downloadUrl: json["downloadUrl"] == null ? [] : List<Image>.from(json["downloadUrl"]!.map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "year": year,
        "releaseDate": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
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
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "downloadUrl": downloadUrl == null ? [] : List<dynamic>.from(downloadUrl!.map((x) => x.toJson())),
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
    List<Artist>? primary;
    List<dynamic>? featured;
    List<Artist>? all;

    Artists({
        this.primary,
        this.featured,
        this.all,
    });

    factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        primary: json["primary"] == null ? [] : List<Artist>.from(json["primary"]!.map((x) => Artist.fromJson(x))),
        featured: json["featured"] == null ? [] : List<dynamic>.from(json["featured"]!.map((x) => x)),
        all: json["all"] == null ? [] : List<Artist>.from(json["all"]!.map((x) => Artist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "primary": primary == null ? [] : List<dynamic>.from(primary!.map((x) => x.toJson())),
        "featured": featured == null ? [] : List<dynamic>.from(featured!.map((x) => x)),
        "all": all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
    };
}
